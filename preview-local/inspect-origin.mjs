import { request } from '@playwright/test';
import fs from 'node:fs';
const client = await request.newContext({timeout:20000});
try {
 for(const url of ['https://modaurbanaoutlet2.lojavirtualnuvem.com.br/?preview=true','https://modaurbanaoficial.com.br/?preview=true']) {
  try {
   const response=await client.get(url,{maxRedirects:0});
   console.log(url,response.status(),JSON.stringify(response.headers()));
   if(response.status()===200){ const body=await response.text(); console.log('Enquadramento novo presente?',body.includes('tf-conjunto-portrait-20261105'));fs.writeFileSync('/private/tmp/moda-origin.html',body);}
  } catch(e){console.log(url,e.message.split('\n')[0]);}
 }
} finally {await client.dispose();}
