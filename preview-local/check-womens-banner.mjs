import {chromium} from '@playwright/test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
 const page=await browser.newPage();
 await page.setExtraHTTPHeaders({'Cache-Control':'no-cache','Pragma':'no-cache'});
 const response=await page.goto('https://www.modaurbanaoficial.com.br/moda-feminina/?banner='+Date.now(),{waitUntil:'domcontentloaded'});
 console.log('HTTP',response.status());
 fs.writeFileSync('artifacts/womens-banner-response.html',await page.content());
 const banner=page.locator('.mu-womens-banner');await banner.waitFor({timeout:15000});
 for(const width of [390,1440]) {
  await page.setViewportSize({width,height:1000});await banner.locator('img').evaluate(i=>i.decode());
  const result=await banner.evaluate(b=>{const i=b.querySelector('img'),r=b.getBoundingClientRect();return {viewport:innerWidth,width:r.width,height:r.height,image:i.naturalWidth,src:i.src,overflow:document.documentElement.scrollWidth>innerWidth}});
  console.log(result);console.log(await page.evaluate(()=>Array.from(document.querySelectorAll("body *")).filter(e=>e.getBoundingClientRect().right>innerWidth+1).slice(0,12).map(e=>({tag:e.tagName,cls:e.className,width:e.getBoundingClientRect().width,right:e.getBoundingClientRect().right}))));assert.equal(result.image,1142);assert(!result.overflow);await page.screenshot({path:`artifacts/womens-banner-${width}.png`});
 }
} finally {await browser.close();}
