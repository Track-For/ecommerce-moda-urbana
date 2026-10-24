import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import assert from 'node:assert/strict';
import { fileURLToPath } from 'node:url';
import Twig from 'twig';
import * as sass from 'sass';
import { chromium } from '@playwright/test';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const read = file => fs.readFileSync(path.join(root, file), 'utf8');
const files = [
  'snipplets/header/header-modals.tpl', 'snipplets/header/header.tpl',
  'snipplets/home/home-featured-grid.tpl', 'snipplets/home/home-slider.tpl',
  'static/css/style-async.scss.tpl', 'static/css/style-critical.tpl',
  'static/js/store.js.tpl', 'static/css/style-editorial-critical.tpl',
  'static/css/style-editorial-async.tpl',
];
const normalize = source => source.replace(/\bwith\{/g, 'with {').replace(/\{%\s*snipplet\s+/g, '{% include ');
for (const file of files) Twig.twig({ data: normalize(read(file)), rethrow: true });
function expand(file, stack = []) {
  assert(!stack.includes(file), `Circular include: ${file}`);
  return read(file).replace(/\{%\s*include\s+["']([^"']+)["']\s*%\}/g,
    (_, dependency) => expand(dependency, [...stack, file]));
}
const settings = Object.fromEntries(read('config/defaults.txt').split(/\r?\n/).filter(line => line.includes(' = ')).map(line => {
  const i = line.indexOf(' = '); return [line.slice(0, i), line.slice(i + 3)];
}));
Twig.extendFilter('has_custom_image', () => false);
Twig.extendFilter('static_url', value => value);
for (const changes of [{}, { hamburger_desktop: false, logo_position_desktop: 'left', search_big_desktop: true }]) {
  for (const file of ['static/css/style-editorial-critical.tpl', 'static/css/style-async.scss.tpl']) {
    const rendered = Twig.twig({ data: expand(file), rethrow: true }).render({ settings: { ...settings, ...changes }, template: 'home' });
    sass.compileString(rendered, { logger: sass.Logger.silent });
  }
}
expand('static/css/style-critical.tpl');
console.log('PASS: 9 Twig parses; 4 editorial critical CSS / full async SCSS compilations; include paths and cycles.');

const source = read('static/js/store.js.tpl');
const start = source.indexOf('var slidesPerViewFeaturedDesktopVal');
const end = source.indexOf('\n            {% endif %}', start);
assert(start >= 0 && end > start);
const fragment = source.slice(start, end);
const vendor = read('static/js/external-no-dependencies.js.tpl').replace(/\{#[\s\S]*?#\}/g, '');
new vm.Script(vendor);
const css = read('static/css/style-editorial-async.tpl').replace(/\{#[\s\S]*?#\}/g, '');
const browser = await chromium.launch({ channel: 'chrome', headless: true });
let cases = 0;
try {
  for (const width of [375, 768, 1440]) for (const reduced of [false, true]) for (const count of [3, 6]) for (const asymmetric of [false, true]) {
    const page = await browser.newPage({ viewport: { width, height: 900 }, reducedMotion: reduced ? 'reduce' : 'no-preference' });
    const errors = [];
    page.on('pageerror', error => errors.push(error.message));
    const rendered = Twig.twig({ data: fragment, rethrow: true }).render({
      featured_columns_desktop: 2, featured_columns_mobile: 1,
      featured_products_asymmetric_slider: asymmetric, sections: { primary: { products: Array(count).fill({}) } },
    });
    new vm.Script(rendered);
    await page.setContent(`<style>.swiper-container{width:100%;overflow:hidden}.swiper-wrapper{display:flex;transition-property:transform}.swiper-slide{flex-shrink:0}${css}</style>
      <div class="tf-featured"><button class="js-swiper-featured-prev">Anterior</button><button class="js-swiper-featured-next">Próxima</button>
      <div class="js-swiper-featured swiper-container"><div class="swiper-wrapper">${Array.from({ length: count }, (_, i) => `<div class="swiper-slide">${i}</div>`).join('')}</div></div><div class="js-swiper-featured-pagination"></div></div>`);
    await page.addScriptTag({ content: vendor });
    await page.addScriptTag({ content: `var homeMotionReduced = matchMedia('(prefers-reduced-motion: reduce)').matches;
      var lazyVal = true, watchOverflowVal = true, centerInsufficientSlidesVal = true, itemSwiperSpaceBetween = 16;
      function hideSwiperControls() {};
      window.swiperLoader = (selector, options) => { window.testSwiper = new Swiper(selector, options); };
      ${rendered}` });
    await page.waitForTimeout(100);
    // Click real navigation controls repeatedly, across both loop boundaries.
    for (const direction of ['next', 'prev']) for (let i = 0; i < count + 2; i++) {
      const before = await page.evaluate(() => ({ index: testSwiper.realIndex, translate: testSwiper.translate }));
      await page.locator(`.js-swiper-featured-${direction}`).click({ force: true });
      await page.waitForTimeout(reduced ? 30 : 650);
      const state = await page.evaluate(() => ({ index: testSwiper.realIndex, translate: testSwiper.translate, animating: testSwiper.animating, speed: testSwiper.params.speed }));
      assert.equal(state.animating, false, JSON.stringify({ width, reduced, count, asymmetric, direction, i, state }));
      assert.equal(state.speed, reduced ? 0 : 300);
      if (count > 3) assert.notEqual(state.index, before.index, 'Loop navigation must keep advancing');
      else if (i === 0) assert.notEqual(state.translate, before.translate, 'Non-loop navigation must move');
    }
    assert.deepEqual(errors, []);
    await page.close();
    cases++;
    console.log(`PASS: width=${width} reduced=${reduced} count=${count} asymmetric=${asymmetric}`);
  }
} finally { await browser.close(); }
console.log(`PASS: ${cases} native Swiper scenarios. Platform services are not exercised.`);
