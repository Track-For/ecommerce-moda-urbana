import fs from 'node:fs';
import { chromium } from '@playwright/test';
const css=fs.readFileSync('static/css/style-shopping.tpl','utf8');
const js=fs.readFileSync('static/js/shopping-improvements.js.tpl','utf8');
const browser=await chromium.launch({channel:'chrome',headless:true});
try {
  const page=await browser.newPage({viewport:{width:390,height:844}});
  await page.goto('https://www.modaurbanaoutlet.com.br/produtos/conjunto-assimetrico-1yayv/',{waitUntil:'domcontentloaded',timeout:45000});
  await page.locator('#product_form').waitFor();
  await page.addStyleTag({content:css});
  await page.addScriptTag({content:js});
  await page.evaluate(()=>{
    const description=document.querySelector('#product-description');
    if(description) {description.style.display='block'; const content=description.querySelector('.user-content'); if(content) { const details=document.createElement('details'); details.className='tf-product-details';details.open=true; const summary=document.createElement('summary');summary.textContent='Sobre a peça'; content.querySelector('h5')?.remove();content.before(details);details.append(summary,content);}}
  });
  const cookie=page.locator('.js-acknowledge-cookies');
  if(await cookie.isVisible()) await cookie.click();
  await page.locator('#product_form').scrollIntoViewIfNeeded();
  await page.waitForTimeout(1000);
  await page.screenshot({path:'preview-local/artifacts/shopping-candidate-mobile.png'});
  console.log('mobile overflow',await page.evaluate(()=>document.documentElement.scrollWidth>innerWidth));
  await page.setViewportSize({width:1440,height:1000});
  await page.evaluate(()=>window.scrollTo(0,0));
  await page.waitForTimeout(1000);
  await page.screenshot({path:'preview-local/artifacts/shopping-candidate-desktop.png'});
  console.log('desktop overflow',await page.evaluate(()=>document.documentElement.scrollWidth>innerWidth));
} finally {await browser.close();}
