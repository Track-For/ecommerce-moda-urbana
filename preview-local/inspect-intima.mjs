import {chromium} from '@playwright/test';
import fs from 'node:fs';
const browser=await chromium.launch({channel:'chrome',headless:true});
try{const page=await browser.newPage();await page.goto('https://www.modaurbanaoficial.com.br/moda-intima-feminina/?inspect='+Date.now(),{waitUntil:'domcontentloaded'});fs.writeFileSync('artifacts/intima-inspect.html',await page.content());console.log('category',await page.title(),await page.locator('.item-product').count(),await page.locator('body').innerText());await page.screenshot({path:'artifacts/intima-inspect.png',fullPage:true});}finally{await browser.close();}
