import fs from 'node:fs';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import { createRequire } from 'node:module';
const require = createRequire('C:/Users/fhell/AppData/Roaming/npm/node_modules/@tiendanube/cli/package.json');
const { Client } = require('basic-ftp');
const root = process.cwd();
const config = JSON.parse(Buffer.from(fs.readFileSync(path.resolve(root, '../05-publicacao/.nuvem'), 'utf8').trim(), 'base64').toString('utf8'))['theme-ftp'];
const images = fs.readdirSync('static/images/hero').map(name => 'static/images/hero/' + name);
const files = process.argv.includes('--layout-only') ? ['layouts/layout.tpl'] : [...images, 'static/css/style-editorial-critical.tpl', 'static/css/style-critical.tpl', 'snipplets/home/home-slider.tpl', 'layouts/layout.tpl'];
const previousRelease = path.join(root, 'preview-local/artifacts/hero-deploy-1793207556053/after');
const backup = path.join(root, 'preview-local/artifacts/hero-deploy-' + Date.now());
const normalize = value => value.toString('utf8').replace(/^\uFEFF/, '').replace(/\r\n/g, '\n');
const client = new Client(30000);
const uploaded = [], absent = [];
try {
  await client.access({host: config.ftp.ftpServer, user: config.ftp.ftpUsername, password: config.ftp.ftpPassword, secure: true});
  for (const file of files) {
    const before = path.join(backup, 'before', file);
    fs.mkdirSync(path.dirname(before), {recursive: true});
    try { await client.downloadTo(before, file); }
    catch (error) { if (error.code === 550 && images.includes(file)) { absent.push(file); continue; } throw error; }
    const remote = fs.readFileSync(before), local = fs.readFileSync(file);
    const previousPath = path.join(previousRelease, file);
    const previous = fs.existsSync(previousPath) ? fs.readFileSync(previousPath) : null;
    if (images.includes(file)) { if (!remote.equals(local) && !(previous && remote.equals(previous))) throw Error('Remote image differs: ' + file); }
    else {
      const base = execFileSync('git', ['show', 'HEAD:' + file]);
      if (normalize(remote) !== normalize(base) && normalize(remote) !== normalize(local) && !(previous && normalize(remote) === normalize(previous))) throw Error('Remote changed: ' + file);
    }
  }
  console.log('Preflight passed for ' + files.length + ' files. Backup: ' + backup);
  if (process.argv.includes('--publish')) {
    await client.ensureDir('static/images/hero');
    await client.cd('/');
    for (const file of files) {
      uploaded.push(file);
      await client.uploadFrom(file, file);
      const after = path.join(backup, 'after', file);
      fs.mkdirSync(path.dirname(after), {recursive: true});
      await client.downloadTo(after, file);
      if (!fs.readFileSync(after).equals(fs.readFileSync(file))) throw Error('Read-back failed: ' + file);
      console.log('Verified: ' + file);
    }
  }
  fs.writeFileSync(path.join(backup, 'result.json'), JSON.stringify({files, uploaded, absent, verified: true, store: config.storeUrl}, null, 2));
} catch (error) {
  console.error(error.message);
  for (const file of uploaded.reverse()) {
    try {
      if (absent.includes(file)) await client.remove(file);
      else await client.uploadFrom(path.join(backup, 'before', file), file);
      console.log('Rolled back: ' + file);
    } catch (rollback) { console.error('Rollback failed: ' + file + ': ' + rollback.message); }
  }
  process.exitCode = 1;
} finally { client.close(); }
