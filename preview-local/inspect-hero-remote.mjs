import fs from 'node:fs';
import {createRequire} from 'node:module';
const require=createRequire('C:/Users/fhell/AppData/Roaming/npm/node_modules/@tiendanube/cli/package.json');
const {Client}=require('basic-ftp');
const config=JSON.parse(Buffer.from(fs.readFileSync('../05-publicacao/.nuvem','utf8').trim(),'base64').toString('utf8'))['theme-ftp'];
const c=new Client(30000);
try {await c.access({host:config.ftp.ftpServer,user:config.ftp.ftpUsername,password:config.ftp.ftpPassword,secure:true});console.log('PWD',await c.pwd());console.log((await c.list()).map(f=>f.name));console.log('Store',config.storeUrl);}finally{c.close()}
