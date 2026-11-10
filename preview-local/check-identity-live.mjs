import {chromium} from '@playwright/test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
 const page=await browser.newPage(); await page.setExtraHTTPHeaders({'Cache-Control':'no-cache','Pragma':'no-cache'});
 const response=await page.goto((process.argv.includes('--local')?'http://localhost:5173/':'https://www.modaurbanaoficial.com.br/?identity='+Date.now()),{waitUntil:'domcontentloaded',timeout:60000});
 console.log('HTTP',response.status(),Object.fromEntries(Object.entries(await response.allHeaders()).filter(([k])=>/cache|age|date|server/.test(k)))); console.log('Page',page.url(),await page.title()); fs.writeFileSync('artifacts/identity-response.html',await page.content()); await page.screenshot({path:'artifacts/identity-response.png'});
 for(const width of [390,1440]) {
  await page.setViewportSize({width,height:1000});
  const logo=page.locator('.mu-brand-logo');await logo.waitFor({timeout:10000});await logo.evaluate(i=>i.decode());
  const result=await page.evaluate(()=>({width:innerWidth,centerError:(()=>{const r=document.querySelector(".mu-brand-logo").getBoundingClientRect();return Math.abs(r.left+r.width/2-innerWidth/2)})(),favicon:document.querySelector('link[rel="icon"]')?.href,logo:document.querySelector('.mu-brand-logo').naturalWidth,palette:getComputedStyle(document.documentElement).getPropertyValue('--mu-sand').trim(),overflow:document.documentElement.scrollWidth>innerWidth}));
  assert(result.logo>0);assert(result.centerError<1,JSON.stringify(result));assert(result.favicon.includes("moda-urbana-favicon.png"));assert.equal(result.palette,'#fbe2d7');assert.equal(result.overflow,false);
  await page.screenshot({path:`artifacts/identity-live-${width}.png`});console.log(result);
 }
} finally {await browser.close();}
