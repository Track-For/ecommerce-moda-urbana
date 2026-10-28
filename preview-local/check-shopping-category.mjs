import {chromium} from '@playwright/test';
import assert from 'node:assert/strict';
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
 const page=await browser.newPage({viewport:{width:390,height:844}});
 await page.goto('https://www.modaurbanaoutlet.com.br/moda-feminina/?category-release='+Date.now(),{waitUntil:'domcontentloaded',timeout:45000});
 const cookie=page.locator('.js-acknowledge-cookies');if(await cookie.isVisible())await cookie.click();
 await page.locator('[data-component="filter-button"]').click();
 await page.locator('#nav-filters').waitFor({state:'visible'});
 await page.screenshot({path:'preview-local/artifacts/shopping-live-filters.png'});
 console.log('LIVE filters opened:',(await page.locator('#nav-filters').innerText()).slice(0,550));
 const filter=page.locator('#nav-filters .js-filter-checkbox').first();
 const before=page.url();
 if(await filter.count()){
  await filter.click();
  await page.waitForURL(url=>url.href!==before,{timeout:20000});
  console.log('LIVE applied URL:',page.url());
 }
 // Follow a product through the actual listing to exercise URL preservation.
 const close=page.locator('#nav-filters .js-modal-close').first();if(await close.isVisible())await close.click();
 const filtered=page.url();
 await page.locator('.category-body .item-product .item-link').first().click();
 await page.locator('.tf-back-to-results').waitFor({timeout:20000});
 assert.equal(await page.locator('.tf-back-to-results').getAttribute('href'),filtered);
 console.log('LIVE return to filtered results verified');
} finally {await browser.close();}
