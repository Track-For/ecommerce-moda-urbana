import { chromium } from '@playwright/test';
import fs from 'node:fs';
const browser = await chromium.launch({ channel: 'chrome', headless: true });
const page = await browser.newPage();
const errors = [];
page.on('pageerror', e => errors.push(e.message));
await page.goto('http://localhost:5173');
await page.locator('header').waitFor();
for (const width of [320, 375, 768, 1440]) {
  await page.setViewportSize({ width, height: 900 });
  for (const layout of ['default', 'desktop', 'left', 'text']) {
    await page.selectOption('#layout', layout);
    await page.waitForTimeout(600);
    const overflow = await page.evaluate(() => document.documentElement.scrollWidth > innerWidth);
    if (overflow) {
      errors.push(`Horizontal overflow ${width}/${layout}`);
      console.log('overflow elements', width, layout, await page.locator('body *').evaluateAll(es=>es.filter(e=>e.getBoundingClientRect().right>innerWidth+1).map(e=>({tag:e.tagName,cls:e.className,right:e.getBoundingClientRect().right,visibility:getComputedStyle(e).visibility})).slice(0,8)));
    }
  }
}
await page.selectOption('#layout','default');
await page.setViewportSize({ width: 375, height: 812 });
await page.locator('[data-toggle="#nav-hamburger"]').click();
await page.locator('#nav-hamburger').waitFor({ state: 'visible' });
await page.locator('#nav-hamburger .js-toggle-menu-panel').first().click();
await page.locator('.nav-list-panel-show').waitFor({ state: 'visible' });
await page.keyboard.press('Escape');
await page.locator('[data-toggle="#nav-search"]').filter({ visible:true }).first().click();
await page.locator('#nav-search input').fill('teste');
await page.locator('#nav-search input').press('Enter');
if (!(await page.locator('#preview-status').textContent()).includes('simulada')) errors.push('Search adapter failed');
await page.keyboard.press('Escape');
await page.locator('[data-toggle="#modal-cart"]').click();
if (!(await page.locator('#modal-cart').textContent()).includes('simulado')) errors.push('Cart adapter failed');
await page.keyboard.press('Escape');
await page.locator('#preview-status').evaluate(el=>el.textContent='');
fs.mkdirSync('test-results',{recursive:true});
for(let y=0;y<await page.evaluate(()=>document.body.scrollHeight);y+=500){await page.evaluate(y=>scrollTo(0,y),y);await page.waitForTimeout(100);}
await page.evaluate(()=>scrollTo(0,0));
await page.waitForTimeout(500);
await page.screenshot({ path:'test-results/mobile.png', fullPage:true });
await page.setViewportSize({ width:1440,height:1000 });
await page.selectOption('#layout','desktop');
await page.waitForTimeout(200);
await page.screenshot({ path:'test-results/desktop.png',fullPage:true });
const slider = page.locator('.js-home-slider');
await page.locator('.js-swiper-home-next').click();
await page.waitForTimeout(400);
if(await slider.evaluate(el=>el.swiper.activeIndex)!==1)errors.push('Hero navigation failed');
await page.emulateMedia({reducedMotion:'reduce'});
if(await page.locator('.tf-home-hero .btn').first().evaluate(el=>getComputedStyle(el).transitionDuration)!=='0s')errors.push('Reduced motion CSS failed');
await page.locator('#compare').click();
if (await page.locator('header').evaluate(e=>e.classList.contains('tf-header'))) errors.push('Comparison failed');
await browser.close();
console.log(JSON.stringify({errors},null,2));
fs.writeFileSync('test-results/report.json',JSON.stringify({errors},null,2));
if(errors.length)process.exitCode=1;

