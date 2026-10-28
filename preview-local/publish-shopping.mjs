import fs from 'node:fs';
import path from 'node:path';
import { execFileSync } from 'node:child_process';
import { createRequire } from 'node:module';
const require=createRequire('C:/Users/fhell/AppData/Roaming/npm/node_modules/@tiendanube/cli/package.json');
const {Client}=require('basic-ftp');
const root=process.cwd();
const config=JSON.parse(Buffer.from(fs.readFileSync(path.resolve(root,'../05-publicacao/.nuvem'),'utf8').trim(),'base64').toString('utf8'))['theme-ftp'];
let files=['static/css/style-shopping.tpl','static/js/shopping-improvements.js.tpl','snipplets/product/product-display-name.tpl','snipplets/product/product-description.tpl','snipplets/product/product-variants.tpl','snipplets/product/product-form.tpl','snipplets/product/product-related.tpl','snipplets/grid/item.tpl','snipplets/banner-services/banner-services-item.tpl','static/css/style-critical.tpl','layouts/layout.tpl','static/js/store.js.tpl'];
const newFiles=files.slice(0,3);
const only=process.argv.find(arg=>arg.startsWith('--only='));
if(only) files=files.filter(file=>file===only.slice(7));
if(!files.length)throw Error('No matching files');
const backup=path.join(root,'preview-local/artifacts/shopping-deploy-'+Date.now());
const normalize=b=>b.toString('utf8').replace(/\r\n/g,'\n');
const client=new Client(30000);
const uploaded=[], absent=[];
try {
  await client.access({host:config.ftp.ftpServer,user:config.ftp.ftpUsername,password:config.ftp.ftpPassword,secure:true});
  for(const file of files) {
    const before=path.join(backup,'before',file);fs.mkdirSync(path.dirname(before),{recursive:true});
    try {await client.downloadTo(before,file);} catch(e) {if(e.code===550&&newFiles.includes(file)){absent.push(file);continue;}throw e;}
    const local=fs.readFileSync(file), remote=fs.readFileSync(before);
    const prior=path.join(root,'preview-local/artifacts/shopping-deploy-1793150307765/after',file);
    const base=newFiles.includes(file)?(fs.existsSync(prior)?fs.readFileSync(prior):local):execFileSync('git',['show','HEAD:'+file],{cwd:root});
    if(normalize(remote)!==normalize(base)&&normalize(remote)!==normalize(local)) throw Error('Remote differs: '+file);
  }
  console.log('Preflight passed: '+files.length+' files. Backup: '+backup);
  if(process.argv.includes('--publish')) {
    for(const file of files) {
      uploaded.push(file);
      await client.uploadFrom(file,file);
      const after=path.join(backup,'after',file);fs.mkdirSync(path.dirname(after),{recursive:true});
      await client.downloadTo(after,file);
      if(!fs.readFileSync(after).equals(fs.readFileSync(file)))throw Error('Read-back failed: '+file);
      console.log('Verified: '+file);
    }
  }
  fs.writeFileSync(path.join(backup,'result.json'),JSON.stringify({files,uploaded,absent,verified:true,store:config.storeUrl,time:new Date().toISOString()},null,2));
} catch(e) {
  console.error(e.message);
  for(const file of uploaded.reverse()) {
    try {if(absent.includes(file))await client.remove(file);else await client.uploadFrom(path.join(backup,'before',file),file);console.log('Rolled back: '+file);}catch(rollback){console.error('Rollback failed for '+file+': '+rollback.message);}
  }
  process.exitCode=1;
} finally {client.close();}
