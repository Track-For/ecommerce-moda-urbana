import fs from 'node:fs';
import assert from 'node:assert/strict';
import { chromium } from '@playwright/test';
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
  const page=await browser.newPage({viewport:{width:390,height:844}});
  page.on('pageerror',e=>console.log('PAGE ERROR',e.message));
  page.on('response',r=>{if(/shipping|calculate|frete/i.test(new URL(r.url()).pathname)) console.log('DELIVERY HTTP',r.status(),new URL(r.url()).pathname);});
  page.on('requestfailed',r=>console.log('FAILED',new URL(r.url()).pathname,r.failure()?.errorText));
  await page.goto('https://www.modaurbanaoutlet.com.br/produtos/conjunto-assimetrico-1yayv/?shopping-release='+Date.now(),{waitUntil:'domcontentloaded',timeout:45000});
  await page.locator('.tf-delivery-title').waitFor({timeout:20000});
  assert.equal(await page.locator('.tf-product-details').count(),1);
  await page.waitForFunction(()=>document.querySelector('.tf-variant-status'));
  const cookie=page.locator('.js-acknowledge-cookies');
  if(await cookie.isVisible()) await cookie.click();
  console.log('LIVE title:',await page.locator('#single-product h1').innerText());
  console.log('LIVE shipping:',await page.locator('.tf-delivery-note').innerText());
  const buttons=page.locator('#product_form .js-insta-variant');
  if(await buttons.count()>1){await buttons.last().click();await page.waitForTimeout(700);console.log('LIVE variant:',await page.locator('.tf-variant-status').innerText());}
  const input=page.locator('#product-shipping-container .js-shipping-input');
  await page.waitForFunction(()=>window.LS && LS.calculateShippingAjax);
  await page.evaluate(()=>{const original=LS.calculateShippingAjax;window.shippingCalls=0;LS.calculateShippingAjax=function(){window.shippingCalls++;return original.apply(this,arguments);};});
  await input.fill('01001000');
  await page.locator('#product-shipping-container .js-calculate-shipping').click();
  try { await page.waitForFunction(()=>{
    const root=document.querySelector('#product-shipping-container');
    const response=root.querySelector('.js-shipping-calculator-response');
    return response && response.textContent.trim() || Array.from(root.querySelectorAll('.js-ship-calculator-error')).some(el=>getComputedStyle(el).display!=='none');
  },null,{timeout:30000}); } catch(e) { console.log('Delivery timeout, native calls:',await page.evaluate(()=>window.shippingCalls)); fs.writeFileSync('preview-local/artifacts/shipping-timeout.html',await page.content()); throw e; }
  console.log('LIVE delivery result:',await page.locator('#product-shipping-container').innerText());
  await page.locator('.tf-product-details').scrollIntoViewIfNeeded();
  await page.waitForTimeout(700);
  console.log('LIVE sticky visible:',await page.locator('.tf-sticky-buy').isVisible());
  console.log('LIVE overflow:',await page.evaluate(()=>document.documentElement.scrollWidth>innerWidth));
  await page.screenshot({path:'preview-local/artifacts/shopping-live-mobile.png'});
  await page.setViewportSize({width:1440,height:1000});
  await page.evaluate(()=>window.scrollTo(0,0));
  await page.waitForTimeout(700);
  await page.screenshot({path:'preview-local/artifacts/shopping-live-desktop.png'});
  fs.writeFileSync('preview-local/artifacts/shopping-live-pdp.html',await page.content());
  console.log('LIVE product checks completed');
} finally {await browser.close();}
