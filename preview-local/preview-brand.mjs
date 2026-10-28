import fs from 'node:fs';
import assert from 'node:assert/strict';
import { chromium } from '@playwright/test';
const css = fs.readFileSync('static/css/style-shopping.tpl', 'utf8');
const live = process.argv.includes('--live');
const browser = await chromium.launch({channel:'chrome', headless:true});
try {
  for (const [name, path] of [['home','/'], ['product','/produtos/conjunto-assimetrico-1yayv/']]) {
    const page = await browser.newPage();
    await page.goto('https://www.modaurbanaoutlet.com.br'+path+'?brand='+Date.now(), {waitUntil:'domcontentloaded',timeout:60000});
    await page.locator('.tf-header').waitFor();
    if (!live) await page.addStyleTag({content:css});
    const cookie = page.locator('.js-acknowledge-cookies');
    if (await cookie.isVisible()) await cookie.click();
    for (const width of [390,1440]) {
      await page.setViewportSize({width,height:1000});
      await page.waitForTimeout(1200);
      assert.equal(await page.evaluate(()=>document.documentElement.scrollWidth>innerWidth),false);
      fs.writeFileSync('preview-local/artifacts/brand-inspect.html',await page.content());
      console.log(await page.evaluate(()=>({palette:getComputedStyle(document.documentElement).getPropertyValue('--mu-ivory'),body:document.body.className,inline:document.body.getAttribute('style')})));
      assert.equal(await page.evaluate(()=>getComputedStyle(document.body).backgroundColor),'rgb(255, 253, 249)');
      await page.screenshot({path:`preview-local/artifacts/brand-${live?'live':'candidate'}-${name}-${width}.png`});
      if(name==='product') {
        await page.locator('#product_form').scrollIntoViewIfNeeded();
        await page.screenshot({path:`preview-local/artifacts/brand-${live?'live':'candidate'}-form-${width}.png`});
      }
      console.log(`PASS ${name} ${width}px: ivory background, no overflow`);
      await page.evaluate(()=>window.scrollTo(0,0));
    }
    await page.close();
  }
} finally { await browser.close(); }
