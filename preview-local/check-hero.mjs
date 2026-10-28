import fs from 'node:fs';
import assert from 'node:assert/strict';
import { chromium } from '@playwright/test';
const live = process.argv.includes('--live');
const browser = await chromium.launch({channel: 'chrome', headless: true});
try {
  const page = await browser.newPage();
  await page.goto(live ? 'https://www.modaurbanaoutlet.com.br/?hero-release=' + Date.now() : 'http://localhost:5173', {waitUntil: 'domcontentloaded', timeout: 60000});
  await page.locator('.tf-campaign-hero').waitFor();
  await page.waitForFunction(() => document.querySelector('.js-home-slider')?.swiper);
  await page.evaluate(() => document.querySelector('.js-home-slider').swiper.autoplay?.stop());
  for (const width of [390, 1440, 820]) {
    await page.setViewportSize({width, height: 1000});
    await page.waitForFunction(mobile => document.querySelector('.tf-campaign-hero .swiper-slide-active img')?.currentSrc.includes(mobile ? 'mobile_820x1000' : 'desktop_1580x600'), width < 768);
    const seen = new Set();
    for (let i = 0; i < 5; i++) {
      const image = page.locator('.tf-campaign-hero .swiper-slide-active img');
      await image.waitFor({state: 'visible'});
      await image.evaluate(img => img.decode());
      const data = await image.evaluate(img => ({src: img.currentSrc, width: img.getBoundingClientRect().width, height: img.getBoundingClientRect().height, naturalWidth: img.naturalWidth, naturalHeight: img.naturalHeight}));
      assert.match(data.src, width < 768 ? /mobile_820x1000/ : /desktop_1580x600/);
      assert.ok(Math.abs(data.width / data.height - (width < 768 ? 820 / 1000 : 1580 / 600)) < .01, JSON.stringify(data));
      assert.ok(data.naturalWidth > 0);
      seen.add(data.src);
      if (i === 0) await page.screenshot({path: `preview-local/artifacts/hero-${live ? 'live' : 'local'}-${width}.png`});
      if (i < 4) {
        await page.locator('.tf-campaign-hero .js-swiper-home-next').click();
        await page.waitForTimeout(400);
      }
    }
    assert.equal(seen.size, 5, 'Five different slides must be reachable');
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth), false);
    const link = await page.locator('.tf-campaign-link').first().getAttribute('href');
    assert.ok(link);
    console.log(`PASS ${width}px: all five banners, correct image source and proportions, working controls, no horizontal overflow; link=${link}`);
    await page.evaluate(() => { const swiper = document.querySelector('.js-home-slider').swiper; if (swiper.params.loop) swiper.slideToLoop(0, 0); else swiper.slideTo(0, 0); });
  }
  fs.writeFileSync(`preview-local/artifacts/hero-${live ? 'live' : 'local'}.html`, await page.content());
  if (!live) await page.addStyleTag({content: '.preview-tools, .preview-notice { display: none !important; }'});
  for (const viewport of [{width: 1366, height: 768}, {width: 390, height: 667}, {width: 1920, height: 1080}]) {
    await page.setViewportSize(viewport);
    await page.evaluate(() => window.scrollTo(0, 0));
    await page.waitForTimeout(300);
    const controls = await page.locator('.tf-campaign-controls').boundingBox();
    assert.ok(controls.y + controls.height <= viewport.height, `Controls outside viewport: ${JSON.stringify({viewport, controls})}`);
    console.log(`PASS controls visible: ${viewport.width}x${viewport.height}`);
  }
} finally { await browser.close(); }
