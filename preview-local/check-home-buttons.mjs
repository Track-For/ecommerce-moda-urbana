import {chromium} from '@playwright/test';
import assert from 'node:assert/strict';
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
 const page=await browser.newPage();
 await page.goto('https://www.modaurbanaoficial.com.br/?homebuttons='+Date.now(),{waitUntil:'networkidle'});
 assert(!(await page.title()).includes('Problemas com o servidor'));
 const actions=page.locator('.tf-plp-actions');
 console.log('Home: grupos de botoes',await actions.count());assert(await actions.count()>0);
 for(const width of [390,1440]) {
  await page.setViewportSize({width,height:1000});
  await page.goto('https://www.modaurbanaoficial.com.br/?homebuttons='+Date.now(),{waitUntil:'networkidle'});
  await page.waitForTimeout(1000);
  await page.locator('.tf-featured').first().scrollIntoViewIfNeeded();await page.waitForTimeout(1500);
  const first=page.locator('.swiper-slide-active .tf-plp-actions, .js-swiper-slide-visible .tf-plp-actions').first();await first.scrollIntoViewIfNeeded();
  assert(await first.locator('.tf-plp-buy').isVisible());assert(await first.locator('.tf-plp-cart').isVisible());
  console.log(width,await first.evaluate(el=>({rect:el.getBoundingClientRect().toJSON(),parent:el.closest('.item-product').getBoundingClientRect().toJSON()})));
  await page.screenshot({path:`artifacts/home-buttons-${width}.png`});
 }
 const variant=page.locator('.swiper-slide-active .tf-plp-cart.js-quickshop-modal-open, .js-swiper-slide-visible .tf-plp-cart.js-quickshop-modal-open').first();
 if(await variant.count()){await variant.click();await page.waitForSelector('#quickshop-modal.modal-show');assert(await page.locator('#quickshop-modal .js-product-form').count()>0);console.log('Modal de variantes OK');}
 console.log('Home validada em celular e desktop');
}finally{await browser.close();}
