import fs from 'node:fs';
import assert from 'node:assert/strict';
import vm from 'node:vm';
import Twig from 'twig';
import * as sass from 'sass';
import { chromium } from '@playwright/test';
const read = file => fs.readFileSync(new URL('../' + file, import.meta.url), 'utf8');
const js = read('static/js/shopping-improvements.js.tpl');
const css = read('static/css/style-shopping.tpl');
// Nuvemshop overrides Twig's standard map-based replace with two string arguments.
Twig.extendFilter('replace', (value, args) => String(value).split(args[0]).join(args[1]));
new vm.Script(js); sass.compileString(css);
for (const file of ['snipplets/product/product-description.tpl', 'snipplets/product/product-variants.tpl', 'snipplets/product/product-form.tpl', 'snipplets/product/product-related.tpl', 'snipplets/product/product-display-name.tpl', 'snipplets/banner-services/banner-services-item.tpl']) {
  Twig.twig({ data: read(file).replace(/\bwith\{/g, 'with {'), rethrow: true });
}
assert.equal(Twig.twig({data:read('snipplets/product/product-display-name.tpl')}).render({product:{name:'CONJUNTO EM LINHO / MODA URBANA OUTLET'}}), 'Conjunto em linho');
const browser = await chromium.launch({ channel: 'chrome', headless: true });
try {
  for (const width of [390, 1440]) {
    const page = await browser.newPage({ viewport: { width, height: 844 } });
    const errors = []; page.on('pageerror', e => errors.push(e.message));
    await page.route('https://shopping.test/**', route => route.fulfill({ contentType:'text/html', body:'<!doctype html><html><body></body></html>' }));
    await page.goto('https://shopping.test/produto');
    await page.evaluate(() => sessionStorage.setItem('tf-product-return', JSON.stringify({url:'https://shopping.test/moda?tamanho=M',time:Date.now()})));
    await page.setContent(`<style>${css}</style><div class="js-overlay" style="display:none"></div><div id="single-product"><div id="price_display">R$139,00</div><form id="product_form"><div class="js-product-variants-group" data-variation-id="0"><label>Tamanho<select><option value="P">P</option><option value="M">M</option></select></label></div><input type="submit" class="cart" data-store="product-buy-button" value="Comprar"></form><details class="tf-product-details" open><summary>Sobre a peça</summary><p>Descrição cadastrada.</p></details><div style="height:1800px"></div></div>`);
    await page.evaluate(() => {
      document.querySelector('#single-product').dataset.variants=JSON.stringify([{option0:'P',available:true},{option0:'M',available:false}]);
      window.buyCount=0;
      document.querySelector('form').addEventListener('submit', e=>{e.preventDefault(); window.buyCount++});
    });
    await page.addScriptTag({ content:js });
    assert.equal(await page.locator('.tf-back-to-results').getAttribute('href'), 'https://shopping.test/moda?tamanho=M');
    assert.equal(await page.locator('.tf-variant-option').count(), 2);
    assert.equal(await page.locator('[data-option="P"]').getAttribute('aria-pressed'), 'true');
    assert.equal(await page.locator('[data-option="M"]').getAttribute('data-unavailable'), 'true');
    await page.locator('[data-option="M"]').click();
    assert.equal(await page.locator('select').inputValue(), 'M');
    await page.locator('[data-option="P"]').click();
    await page.evaluate(()=>window.scrollTo(0,700));
    await page.waitForTimeout(100);
    if (width < 768) {
      await page.locator('.tf-sticky-buy').waitFor({state:'visible'});
      await page.locator('.tf-sticky-buy button').click();
      assert.equal(await page.evaluate(()=>window.buyCount), 1);
      await page.evaluate(()=>{ document.querySelector('#price_display').textContent='R$159,00'; document.querySelector('[data-store="product-buy-button"]').disabled=true; });
      await page.waitForTimeout(100);
      assert.equal(await page.locator('.tf-sticky-buy-price').textContent(), 'R$159,00');
      assert.equal(await page.locator('.tf-sticky-buy button').isDisabled(), true);
      await page.evaluate(()=>document.querySelector('.js-overlay').style.display='block');
      await page.waitForTimeout(100);
      assert.equal(await page.locator('.tf-sticky-buy').isVisible(), false);
    } else assert.equal(await page.locator('.tf-sticky-buy').isVisible(), false);
    assert.deepEqual(errors, []);
    console.log('PASS shopping interactions at ' + width + 'px');
    await page.close();
  }
} finally { await browser.close(); }
