import fs from 'node:fs';
import assert from 'node:assert/strict';
import {chromium} from '@playwright/test';
const js=fs.readFileSync('static/js/shopping-improvements.js.tpl','utf8');
const css=fs.readFileSync('static/css/style-shopping.tpl','utf8');
const empty=fs.readFileSync('preview-local/tabela-medidas-modelo.html','utf8');
// Synthetic measurements for testing only; never uploaded as product content.
const filled=empty.replace('<th scope="row"></th><td></td>', '<th scope="row">Teste</th><td>100</td>');
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
 for(const width of [390,1440]) {
  const page=await browser.newPage({viewport:{width,height:900}});
  for(const [name,content,expected] of [['filled',filled,1],['empty',empty,0],['absent','<p>Descrição da peça.</p>',0],['unrelated','<table><tr><td>Material</td><td>100% algodão</td></tr></table>',0],['caption',filled.replace('<h3>Tabela de medidas (cm)</h3>','').replace('<table>','<table><caption>Tabela de medidas (cm)</caption>'),1]]) {
   await page.setContent(`<style>${css}</style><div id="single-product"><form id="product_form"><div class="js-product-variants"></div><input class="cart" data-store="product-buy-button" type="submit" value="Comprar"></form><div id="product-description"><div class="user-content"><p>Descrição preservada.</p>${content}<p>Orientações preservadas.</p></div></div></div>`);
   await page.addScriptTag({content:js});
   assert.equal(await page.locator('.tf-size-chart').count(),expected,name);
   assert.match(await page.locator('#product-description').innerText(),/Descrição preservada/);
   assert.match(await page.locator('#product-description').innerText(),/Orientações preservadas/);
   if(expected) {
    await page.locator('.tf-size-chart summary').click();
    assert.equal(await page.locator('.tf-size-chart table').isVisible(),true);
    assert.match(await page.locator('.tf-size-chart table').innerText(),/100/);
    assert.equal(await page.evaluate(()=>document.documentElement.scrollWidth>innerWidth),false);
    if(name==='filled') await page.screenshot({path:`preview-local/artifacts/size-chart-${width}.png`});
   }
   if(name==='unrelated') assert.equal(await page.locator('#product-description table').isVisible(),true);
   console.log(`PASS size chart ${name} ${width}px`);
  }
  await page.close();
 }
} finally {await browser.close();}
