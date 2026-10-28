import fs from 'node:fs';
import {createRequire} from 'node:module';
const require=createRequire('C:/Users/fhell/AppData/Roaming/npm/node_modules/@tiendanube/cli/package.json');
const {Client}=require('basic-ftp');
const config=JSON.parse(Buffer.from(fs.readFileSync('../05-publicacao/.nuvem','utf8').trim(),'base64').toString())['theme-ftp'];
const backup='preview-local/artifacts/shopping-deploy-1793150307765';
const state=JSON.parse(fs.readFileSync(backup+'/result.json','utf8'));
const client=new Client(30000);
try {
 await client.access({host:config.ftp.ftpServer,user:config.ftp.ftpUsername,password:config.ftp.ftpPassword,secure:true});
 for(const file of [...state.files].reverse()) {
  if(state.absent.includes(file))continue;
  await client.uploadFrom(backup+'/before/'+file,file);
  console.log('Restored: '+file);
 }
} finally {client.close();}
