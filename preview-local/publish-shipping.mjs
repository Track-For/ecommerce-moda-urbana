import fs from 'node:fs';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import { createRequire } from 'node:module';
import { fileURLToPath } from 'node:url';
const require = createRequire('C:/Users/fhell/AppData/Roaming/npm/node_modules/@tiendanube/cli/package.json');
const { Client } = require('basic-ftp');
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const config = JSON.parse(Buffer.from(fs.readFileSync(path.resolve(root, '../05-publicacao/.nuvem'), 'utf8').trim(), 'base64').toString('utf8'))['theme-ftp'];
const backup = path.join(root, 'preview-local/artifacts/shipping-deploy-' + Date.now());
const files = ['snipplets/header/header.tpl', 'snipplets/labels.tpl'];
const normalize = b => b.toString('utf8').replace(/\r\n/g, '\n');
const client = new Client(30000);
try {
  await client.access({ host: config.ftp.ftpServer, user: config.ftp.ftpUsername, password: config.ftp.ftpPassword, secure: true });
  for (const file of files) {
    const before = path.join(backup, 'before', file);
    fs.mkdirSync(path.dirname(before), { recursive: true });
    await client.downloadTo(before, file);
    const base = execFileSync('git', ['show', 'HEAD:' + file], { cwd: root });
    const remote = fs.readFileSync(before);
    if (normalize(remote) !== normalize(base) && normalize(remote) !== normalize(fs.readFileSync(path.join(root, file)))) throw new Error('Remote changes require review: ' + file);
  }
  for (const file of files) {
    await client.uploadFrom(path.join(root, file), file);
    const after = path.join(backup, 'after', file);
    fs.mkdirSync(path.dirname(after), { recursive: true });
    await client.downloadTo(after, file);
    if (!fs.readFileSync(after).equals(fs.readFileSync(path.join(root, file)))) throw new Error('Verification failed: ' + file);
    console.log('Uploaded and verified: ' + file);
  }
  fs.writeFileSync(path.join(backup, 'result.json'), JSON.stringify({ files, verified: true, store: config.storeUrl, time: new Date().toISOString() }, null, 2));
  console.log('Backup: ' + backup);
} catch (error) {
  console.error(error.message);
  process.exitCode = 1;
} finally { client.close(); }
