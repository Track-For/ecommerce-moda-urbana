import {chromium} from '@playwright/test';
import assert from 'node:assert/strict';
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
const page=await browser.newPage();
await page.goto('https://www.modaurbanaoficial.com.br/moda-feminina/?plp='+Date.now(),{waitUntil:'networkidle'});
console.log('Title:',await page.title(),'Actions:',await page.locator('.tf-plp-actions').count());
assert(await page.locator('.tf-plp-actions').count()>0);
for(const width of [390,1440]) {await page.setViewportSize({width,height:1000});assert(await page.locator('.tf-plp-buy').first().isVisible());assert(await page.locator('.tf-plp-cart').first().isVisible());assert(await page.locator('.tf-plp-actions').first().evaluate(el=>{const r=el.getBoundingClientRect();return r.left>=0&&r.right<=innerWidth;}));await page.screenshot({path:`artifacts/plp-buttons-${width}.png`,fullPage:true});}
const variant=page.locator('.tf-plp-cart.js-quickshop-modal-open').first();
if(await variant.count()){await variant.click();await page.waitForSelector('#quickshop-modal.modal-show');assert(await page.locator('#quickshop-modal .js-product-form').count()>0);console.log('Variant modal OK');}
await page.goto('https://www.modaurbanaoficial.com.br/moda-masculina/?plp='+Date.now(),{waitUntil:'networkidle'});
assert.equal(await page.locator('.category-body .item-product').count(),0);
assert.equal(await page.locator('.nav-item a[href*="moda-masculina"], .nav-item a[href*="cuecas-super-luxo"]').count(),0);
console.log('Menswear hidden OK');
}finally{await browser.close();}
