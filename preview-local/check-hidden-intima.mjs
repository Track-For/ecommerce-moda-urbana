import {chromium} from '@playwright/test';
import assert from 'node:assert/strict';
const browser=await chromium.launch({channel:'chrome',headless:true});
try {const page=await browser.newPage();await page.goto('https://www.modaurbanaoficial.com.br/?navigation='+Date.now(),{waitUntil:'domcontentloaded'});const links=await page.locator('a[href*="/moda-intima-feminina"]').count();console.log('Links para Moda Íntima Feminina:',links);assert.equal(links,0);}finally{await browser.close();}
