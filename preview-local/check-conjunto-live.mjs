import { chromium } from '@playwright/test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
const browser = await chromium.launch({ channel: 'chrome', headless: true });
try {
  const page = await browser.newPage();
  await page.setExtraHTTPHeaders({ 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' });
  const address = new URL(process.argv[2] || 'https://www.modaurbanaoficial.com.br/');
  address.searchParams.set('conjunto', String(Date.now()));
  const response = await page.goto(address.href, { waitUntil: 'domcontentloaded', timeout: 30000 });
  console.log('HTTP', response.status(), JSON.stringify(Object.fromEntries(Object.entries(await response.allHeaders()).filter(([key]) => /cache|age|date|server|via/.test(key)))));
  fs.writeFileSync('/private/tmp/moda-live-check.html', await page.content());
  for (const width of [390, 1440]) {
    await page.setViewportSize({ width, height: 1000 });
    const card = page.locator('.tf-edit-lead');
    const image = card.locator('.tf-edit-image');
    await image.scrollIntoViewIfNeeded();
    await page.waitForFunction(() => {
      const img = document.querySelector('.tf-edit-lead .tf-edit-image');
      return img?.complete && img.naturalWidth > 100;
    });
    const result = await image.evaluate(img => {
      const r = img.getBoundingClientRect();
      const frame = img.parentElement.getBoundingClientRect();
      const caption = img.closest('.tf-edit-card').querySelector('.tf-edit-caption').getBoundingClientRect();
      return { width: r.width, height: r.height, naturalWidth: img.naturalWidth, naturalHeight: img.naturalHeight, captionBelow: caption.top >= frame.bottom - 1, fit: getComputedStyle(img).objectFit, frameRatio: frame.width / frame.height, cropTop: frame.top - r.top, bottomVisible: Math.abs(frame.bottom - r.bottom) < 1 };
    });
    assert.ok(Math.abs(result.width / result.height - result.naturalWidth / result.naturalHeight) < .01, JSON.stringify(result));
    assert.ok(result.captionBelow, JSON.stringify(result));
    assert.equal(result.fit, 'contain');
    assert.ok(Math.abs(result.frameRatio - .75) < .01);
    assert.ok(result.cropTop > 0 && result.cropTop < result.height * .25);
    assert.ok(result.bottomVisible);
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth), false);
    await card.screenshot({ path: `artifacts/conjunto-publicado-${width}.png` });
    console.log('PASS', width, JSON.stringify(result));
  }
  console.log('Loja verificada:', page.url());
} finally {
  await browser.close();
}
