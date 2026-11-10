const ORIGINS = new Set(['https://www.modaurbanaoficial.com.br', 'https://modaurbanaoficial.com.br']);
const DAY = 86400000;
const memoryLimits = new Map();
let snapshotPromise;
const safeHeaders = { 'Cache-Control':'no-store', 'X-Content-Type-Options':'nosniff', 'Referrer-Policy':'no-referrer' };
export function normalizeIdentifier(input) {
  if (typeof input !== 'string' || input.length > 254) return null;
  const value = input.trim().toLowerCase();
  if (value.includes('@')) return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) ? 'email:' + value : null;
  if (!/^[\d.\-\s]+$/.test(value)) return null;
  const cpf=value.replace(/\D/g,'');
  if (cpf.length!==11 || /^(\d)\1{10}$/.test(cpf)) return null;
  for (let size=9;size<=10;size++) {
    let sum=0; for(let i=0;i<size;i++) sum+=Number(cpf[i])*(size+1-i);
    let digit=(sum*10)%11; if(digit===10)digit=0;
    if(digit!==Number(cpf[size])) return null;
  }
  return 'cpf:' + cpf;
}
async function hash(value, secret) {
  const key=await crypto.subtle.importKey('raw',new TextEncoder().encode(secret),{name:'HMAC',hash:'SHA-256'},false,['sign']);
  const bytes=await crypto.subtle.sign('HMAC',key,new TextEncoder().encode(value));
  return Array.from(new Uint8Array(bytes),v=>v.toString(16).padStart(2,'0')).join('');
}
export function publicOrder(order) {
  const statuses={unpacked:'Aguardando preparação',unshipped:'Preparando envio',unfulfilled:'Preparando envio',shipped:'Enviado à transportadora',fulfilled:'Enviado à transportadora',delivered:'Entregue',partially_packed:'Preparando parte do pedido',partially_fulfilled:'Pedido enviado parcialmente'};
  return {number:String(order.number??'').replace(/[^\d]/g,'').slice(0,20),date:String(order.created_at??'').slice(0,10),status:order.status==='cancelled'?'Pedido cancelado':statuses[order.shipping_status]??'Aguardando atualização de envio'};
}
async function loadIndex(env, ctx) {
  const cache=globalThis.caches?.default;
  const cacheKey=new Request('https://tracking.internal.invalid/index/'+await hash(env.NUVEMSHOP_STORE_ID,env.TRACKING_HASH_SECRET));
  const hit=await cache?.match(cacheKey); if(hit)return hit.json();
  if(snapshotPromise)return snapshotPromise;
  snapshotPromise=(async()=>{
    const entries=[];
    const cutoff=new Date(Date.now()-180*DAY).toISOString();
    for(let page=1;page<=50;page++) {
      const url=new URL('https://api.nuvemshop.com.br/2025-03/'+env.NUVEMSHOP_STORE_ID+'/orders');
      url.search=new URLSearchParams({page:String(page),per_page:'200',created_at_min:cutoff,fields:'number,contact_email,contact_identification,shipping_status,status,created_at,updated_at'}).toString();
      const response=await fetch(url,{headers:{Authorization:'Bearer '+env.NUVEMSHOP_ACCESS_TOKEN,'User-Agent':'Moda Urbana tracking (https://www.modaurbanaoficial.com.br)','Accept':'application/json'},signal:AbortSignal.timeout(12000)});
      if(!response.ok) throw new Error('upstream_unavailable');
      const orders=await response.json(); if(!Array.isArray(orders))throw new Error('invalid_upstream');
      for(const order of orders) {
        const keys=[];
        for(const value of [order.contact_email,order.contact_identification]) {
          const id=normalizeIdentifier(value);if(id)keys.push(await hash(id,env.TRACKING_HASH_SECRET));
        }
        if(keys.length)entries.push({keys,order:publicOrder(order)});
      }
      if(orders.length<200)break;
      if(page===50)throw new Error('index_limit');
      await new Promise(resolve=>setTimeout(resolve,550));
    }
    if(cache)ctx.waitUntil(cache.put(cacheKey,new Response(JSON.stringify(entries),{headers:{'Content-Type':'application/json','Cache-Control':'max-age=60'}})));
    return entries;
  })();
  try{return await snapshotPromise;}finally{snapshotPromise=undefined;}
}
async function allowAttempt(request, env, ctx) {
  const ip=request.headers.get('CF-Connecting-IP') || request.headers.get('X-Real-IP') || 'unknown';
  const window=Math.floor(Date.now()/60000);
  const key=await hash(ip+':'+window,env.TRACKING_HASH_SECRET);
  const cache=globalThis.caches?.default;
  const cacheKey=new Request('https://tracking.internal.invalid/rate/'+key);
  const stored=await cache?.match(cacheKey);
  const current=Math.max(memoryLimits.get(key)||0,stored?Number(await stored.text())||0:0);
  if(current>=12)return false;
  memoryLimits.set(key,current+1);
  if(memoryLimits.size>3000)memoryLimits.delete(memoryLimits.keys().next().value);
  if(cache)ctx.waitUntil(cache.put(cacheKey,new Response(String(current+1),{headers:{'Cache-Control':'max-age=120'}})));
  return true;
}
const page=`<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="robots" content="noindex,nofollow"><title>Acompanhar pedido | Moda Urbana</title><style>
*{box-sizing:border-box}body{margin:0;background:#fffaf6;color:#49352e;font:16px/1.6 system-ui,sans-serif}header{padding:20px 24px;border-bottom:1px solid #ebc9b7}header a{color:#8e4939;text-decoration:none;font-weight:700;letter-spacing:.08em}main{max-width:600px;margin:52px auto;padding:0 24px 48px}small,.note{font-size:13px;color:#79675f}h1{font-size:32px;line-height:1.2;color:#8e4939;margin:10px 0 16px}p{margin:0 0 24px}form{padding:24px;border:1px solid #ebc9b7;background:#fff;border-radius:16px}label{display:block;font-weight:600;margin-bottom:8px}input{width:100%;height:52px;border:1px solid #cbb1a4;border-radius:8px;padding:0 14px;font:inherit}button{width:100%;min-height:50px;padding:12px 16px;border:0;border-radius:8px;background:#8e4939;color:#fff;font:600 16px system-ui;margin-top:16px;cursor:pointer}button:disabled{opacity:.6;cursor:wait}input:focus-visible,button:focus-visible,a:focus-visible{outline:3px solid #b47b60;outline-offset:3px}#message{margin:20px 0 0}#results{list-style:none;padding:0}#results li{padding:20px;border:1px solid #ebc9b7;border-radius:12px;background:#fff;margin:12px 0}#results strong{display:block;color:#8e4939;font-size:18px}#results span{font-size:14px}footer{margin-top:28px}a{color:#8e4939}.note{margin:12px 0 0}#results:empty{display:none}@media(max-width:480px){main{margin-top:32px}h1{font-size:28px}form{padding:20px}}
</style></head><body><header><a href="https://www.modaurbanaoficial.com.br/">MODA URBANA OFICIAL</a></header><main><small>ACOMPANHAMENTO DE ENTREGA</small><h1>Onde está meu pedido?</h1><p>Informe o e-mail ou CPF usado na compra para consultar o andamento da entrega. Sem cadastro ou senha.</p><form id="tracking"><label for="identifier">E-mail ou CPF da compra</label><input id="identifier" name="identifier" type="text" required maxlength="254" autocomplete="off" autocapitalize="none" spellcheck="false" placeholder="Seu e-mail ou CPF" aria-describedby="privacy"><p id="privacy" class="note">Exibimos apenas o status de envio dos pedidos dos últimos 6 meses.</p><button type="submit">Consultar entrega</button></form><div id="message" role="status" aria-live="polite"></div><ul id="results" aria-label="Andamento dos pedidos"></ul><footer><a href="https://wa.me/5519989794848" target="_blank" rel="noopener noreferrer">Preciso de ajuda pelo WhatsApp</a><p class="note">As informações acompanham as atualizações de envio registradas pela loja. Não exibimos endereço, produtos ou dados de pagamento.</p><a class="note" href="https://www.modaurbanaoficial.com.br/politica-de-privacidade/">Política de privacidade</a></footer></main><script>
const form=document.querySelector('#tracking'),input=document.querySelector('#identifier'),button=form.querySelector('button'),message=document.querySelector('#message'),results=document.querySelector('#results');
form.addEventListener('submit',async event=>{event.preventDefault();results.replaceChildren();message.textContent='Consultando sua entrega…';button.disabled=true;try{const response=await fetch('/api/track',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({identifier:input.value}),cache:'no-store',credentials:'omit'});const data=await response.json();if(!response.ok)throw new Error(data.message||'Não foi possível consultar agora.');input.value='';if(!data.orders.length){message.textContent='Não encontramos entregas com esses dados nos últimos 6 meses. Confira o e-mail ou CPF informado. Se a compra foi recente, tente novamente em instantes.';return;}message.textContent=data.orders.length===1?'Encontramos seu pedido:':'Encontramos seus pedidos:';for(const order of data.orders){const item=document.createElement('li'),title=document.createElement('strong'),description=document.createElement('span');title.textContent=order.status;description.textContent='Pedido '+(order.number?'#'+order.number:'')+(order.date?' · Compra em '+order.date.split('-').reverse().join('/'):'');item.append(title,description);results.append(item);}}catch(error){message.textContent=error.message||'Não foi possível consultar agora. Tente novamente em instantes.';}finally{button.disabled=false;}});
</script></body></html>`;
export default { async fetch(request,env,ctx) {
  const url=new URL(request.url);
  if(url.pathname==='/' && (request.method==='GET'||request.method==='HEAD')) return new Response(request.method==='HEAD'?null:page,{headers:{...safeHeaders,'Content-Type':'text/html; charset=utf-8','Content-Security-Policy':"default-src 'none'; style-src 'unsafe-inline'; script-src 'unsafe-inline'; connect-src 'self'; base-uri 'none'; form-action 'self'; frame-ancestors https://www.modaurbanaoficial.com.br https://modaurbanaoficial.com.br"}});
  const origin=request.headers.get('Origin');const cors=origin&&ORIGINS.has(origin)?{'Access-Control-Allow-Origin':origin,'Vary':'Origin'}:{};
  const json=(data,status=200)=>new Response(JSON.stringify(data),{status,headers:{...safeHeaders,...cors,'Content-Type':'application/json; charset=utf-8'}});
  if(url.pathname!=='/api/track')return json({message:'Página não encontrada.'},404);
  if(request.method==='OPTIONS')return new Response(null,{status:204,headers:{...safeHeaders,...cors,'Access-Control-Allow-Methods':'POST','Access-Control-Allow-Headers':'Content-Type'}});
  if(request.method!=='POST')return json({message:'Método não permitido.'},405);
  if(origin && origin!==url.origin && !ORIGINS.has(origin))return json({message:'Origem não permitida.'},403);
  if(!env.NUVEMSHOP_ACCESS_TOKEN||!/^\d+$/.test(env.NUVEMSHOP_STORE_ID||'')||!env.TRACKING_HASH_SECRET)return json({message:'A consulta está temporariamente indisponível. Fale com a loja pelo WhatsApp.'},503);
  if(!request.headers.get('Content-Type')?.startsWith('application/json'))return json({message:'Requisição inválida.'},415);
  try {
    if(!await allowAttempt(request,env,ctx))return json({message:'Muitas consultas. Aguarde um minuto e tente novamente.'},429);
    const raw=await request.text();if(raw.length>1024)return json({message:'Requisição inválida.'},413);
    let body;try{body=JSON.parse(raw);}catch{return json({message:'Requisição inválida.'},400);}
    const id=normalizeIdentifier(body.identifier);if(!id)return json({message:'Informe um e-mail válido ou um CPF válido com 11 dígitos.'},400);
    const digest=await hash(id,env.TRACKING_HASH_SECRET);
    const entries=await loadIndex(env,ctx);
    const orders=entries.filter(item=>item.keys.includes(digest)).map(item=>item.order).sort((a,b)=>b.date.localeCompare(a.date)).slice(0,20);
    return json({orders});
  }catch{return json({message:'Não foi possível atualizar o rastreamento agora. Tente novamente em instantes ou fale com a loja.'},503);}
}};
