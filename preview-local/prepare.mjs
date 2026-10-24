import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import Twig from 'twig';
import * as sass from 'sass';

const local = path.dirname(fileURLToPath(import.meta.url));
const root = path.dirname(local);
const htmlOnly = process.argv.includes('--html-only');
const cache = path.join(local, '.templates');
const out = path.join(local, 'public/generated');
fs.mkdirSync(out, { recursive: true });
const read = p => fs.readFileSync(path.join(root, p), 'utf8');
const settings = Object.fromEntries(read('config/defaults.txt').split(/\r?\n/).filter(l => l.includes(' = ')).map(l => {
  const i = l.indexOf(' = '); const v = l.slice(i + 3);
  return [l.slice(0, i), /^\d+$/.test(v) ? Number(v) : v];
}));
for (const [k, v] of Object.entries(settings)) if (k.endsWith('_pt')) settings[k.slice(0, -3)] = v;
// Fixtures only: no store connection or production configuration.
Object.assign(settings, { account_header: true, add_to_cart_recommendations: false, slider: [], slider_mobile: [] });
const translations = { 'Menú': 'Menu', 'Buscar': 'Buscar', 'Buscador': 'Busca', 'Mi cuenta': 'Minha conta', 'Iniciar sesión': 'Entrar', 'Crear cuenta': 'Criar conta', 'Cerrar': 'Fechar', 'Carrito': 'Carrinho', 'Carrito de compras': 'Carrinho de compras', '¿Qué estás buscando?': 'O que você procura?', 'Ver todo en': 'Ver tudo em', 'Ver todos los productos': 'Ver todos os produtos', 'El carrito de compras está vacío.': 'O carrinho simulado está vazio.' };
const esc = s => String(s ?? '').replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
Twig.extendFilter('translate', (v, args = []) => { let t = String(translations[v] || v); (Array.isArray(args) ? args : []).forEach((a, i) => t = t.replace(`{${i + 1}}`, a)); return t; });
Twig.extendFilter('t', v => translations[v] || v);
Twig.extendFilter('has_custom_image', () => false);
Twig.extendFilter('static_url', v => `/generated/${path.basename(v)}`);
Twig.extendFilter('settings_image_url', v => v);
Twig.extendFilter('setting_url', v => v);
Twig.extendFilter('is_external', v => /^https?:\/\//.test(v || ''));
Twig.extendFilter('add_param', v => v);
Twig.extendFilter('money', () => 'Preço indisponível na prévia');
Twig.extendFilter('a_tag', (v, a = []) => `<a href="${esc(a[0] || '#')}" class="${esc(a[2] || '')}">${esc(v)}</a>`);
Twig.extendFunction('component', (name) => {
  if (name === 'logos/logo') return '<div id="logo" class="logo-img-container"><a class="logo-text-container" href="#inicio" aria-label="Moda Urbana Outlet — logo textual simulado"><span class="logo-text h3 mb-0">MODA URBANA<br>OUTLET</span></a></div>';
  return '';
});
function copyTemplates(dir) {
  for (const entry of fs.readdirSync(path.join(root, dir), { withFileTypes: true })) {
    const rel = `${dir}/${entry.name}`;
    if (entry.isDirectory()) { copyTemplates(rel); continue; }
    if (!rel.endsWith('.tpl')) continue;
    const target = path.join(cache, rel); fs.mkdirSync(path.dirname(target), { recursive: true });
    let source = read(rel).replace(/\bwith\{/g, 'with {').replace(/\{%\s*snipplet\s+["']([^"']+)["']\s*%\}/g, '{% include "snipplets/$1" %}');
    // The JS renderer resolves includes relative to each template, unlike the platform.
    source = source.replace(/(['"])((?:snipplets|static)\/[^'"\n]+)\1/g, (_, q, p) => q + path.relative(path.dirname(target), path.join(cache, p)).replaceAll('\\', '/') + q);
    // Platform-owned components are unavailable offline; do not imitate checkout or apps.
    source = source.replace(/\{\{\s*component\([\s\S]*?\}\}/g, expression => expression.includes("'product-item-image'") ? '<div class="item-image"><a href="#vitrine" class="position-relative d-block"><img src="{{ product.preview_image | default(\'/generated/product-placeholder.svg\') }}" style="position:relative;width:100%;height:auto" alt="Foto do produto não disponível na prévia"></a></div>' : '');
    if (rel === 'snipplets/header/header-logo.tpl') source = '<div id="logo" class="logo-img-container"><a class="logo-text-container" href="#inicio" aria-label="Moda Urbana Outlet — logo textual simulado"><span class="logo-text h3 mb-0">MODA URBANA<br>OUTLET</span></a></div>';
    if (rel === 'snipplets/cart-panel.tpl') source = '<p class="alert alert-info">Carrinho simulado vazio.</p><p>Compras, frete e checkout não estão conectados nesta prévia.</p>';
    fs.writeFileSync(target, source);
  }
}
copyTemplates('snipplets'); copyTemplates('static/css');
const navigation = ['Camisetas', 'Calças', 'Acessórios'].map((name, i) => ({ name, url: '#vitrine', isCategory: true, subitems: i === 0 ? [{ name: 'Categoria de exemplo', url: '#vitrine' }] : [] }));
const context = { settings, template: 'home', params: { preview: true }, navigation, languages: [{ active: true, lang: 'pt', country: 'BR' }], cart: { items_count: 0, items: [], total: 0, free_shipping: {} }, store: { name: 'Moda Urbana Outlet', search_url: '#busca', cart_url: '#carrinho', products_url: '#vitrine', customer_login_url: '#conta', customer_register_url: '#conta', customer_accounts: 'optional' } };
function render(rel, data = context) {
  return Twig.twig({ path: path.join(cache, rel), async: false, rethrow: true }).render(data);
}
if (!htmlOnly) for (const [source, name] of [['style-tokens.tpl','tokens.css'],['style-critical.tpl','critical.css'],['style-colors.scss.tpl','colors.css'],['style-async.scss.tpl','async.css']]) {
  const rendered = render(`static/css/${source}`);
  const css = source.includes('scss') ? sass.compileString(rendered, { style: 'expanded', logger: sass.Logger.silent }).css : rendered;
  fs.writeFileSync(path.join(out, name), css);
}
fs.copyFileSync(path.join(root,'static/images/empty-placeholder.png'), path.join(out,'empty-placeholder.png'));
for (const [name, changes] of Object.entries({ default: {}, desktop: { hamburger_desktop: false }, left: { hamburger_desktop: false, logo_position_desktop: 'left', search_big_desktop: true }, text: { utilities_type_mobile: 'text', utilities_type_desktop: 'text' } })) {
  const variant = { ...context, settings: { ...settings, ...changes } };
  fs.writeFileSync(path.join(out, `header-${name}.html`), render('snipplets/header/header.tpl', variant));
  if (htmlOnly) continue;
  const styles = ['style-tokens.tpl','style-critical.tpl','style-colors.scss.tpl','style-async.scss.tpl'].map(source => {
    const css = render(`static/css/${source}`, variant);
    return source.includes('scss') ? sass.compileString(css, { logger: sass.Logger.silent }).css : css;
  }).join('\n');
  fs.writeFileSync(path.join(out, `theme-${name}.css`), styles);
}
console.log('Prévia gerada a partir do Cali. Fontes originais somente lidas.');

// Neutral local placeholders, never substitute another brand's campaigns or products.
fs.writeFileSync(path.join(out,'hero-placeholder.svg'), '<svg xmlns="http://www.w3.org/2000/svg" width="1600" height="760" viewBox="0 0 1600 760"><rect width="1600" height="760" fill="#deddd9"/><path d="M1120 0h480v760h-480z" fill="#d1d0cb"/><path d="M1180 0L800 760" stroke="#f0efec" stroke-width="1"/><text x="52" y="62" fill="#77756f" font-family="Arial,sans-serif" font-size="15" letter-spacing="3">IMAGEM DA CAMPANHA NÃO DISPONÍVEL LOCALMENTE</text></svg>');
fs.writeFileSync(path.join(out,'product-placeholder.svg'), '<svg xmlns="http://www.w3.org/2000/svg" width="600" height="760" viewBox="0 0 600 760"><rect width="600" height="760" fill="#eeedea"/><rect x="40" y="40" width="520" height="680" fill="none" stroke="#d4d2cc"/><text x="300" y="375" text-anchor="middle" fill="#77756f" font-family="Arial,sans-serif" font-size="14" letter-spacing="2">FOTO NÃO DISPONÍVEL</text><text x="300" y="405" text-anchor="middle" fill="#77756f" font-family="Arial,sans-serif" font-size="12">Placeholder · sem produto fictício</text></svg>');
const homeSettings = { ...settings, slider_text_outside: false, slider: [
  { image:'hero-placeholder.svg', width:1600, height:760, title:'Moda Urbana Outlet', description:'Espaço reservado à campanha configurada no painel.', button:'Ver estrutura da vitrine', link:'#vitrine', color:'dark' },
  { image:'hero-placeholder.svg', width:1600, height:760, title:'Sua campanha neste espaço', description:'Segundo slide simulado para testar os controles do Cali.', button:'Ver estrutura da vitrine', link:'#vitrine', color:'dark' }
] };
const products = JSON.parse(fs.readFileSync(path.join(local, 'product-fixture.json'), 'utf8')).map(p => ({ ...p, preview_image: p.image, display_price:false, price:null, has_stock:true, available:false, variations:[], isSubscriptionOnly:()=>false, isSubscribable:()=>false }));
homeSettings.featured_products_format = 'slider';
homeSettings.featured_products_title = 'Destaques';
homeSettings.module = JSON.parse(fs.readFileSync(path.join(local, 'module-fixture.json'), 'utf8')).slides;

const homeContext = { ...context, settings:homeSettings, sections:{primary:{products}}, has_featured:true };
fs.writeFileSync(path.join(out,'home.html'), render('snipplets/home/home-slider.tpl',homeContext) + '<section id="vitrine" aria-label="Amostra p?blica de produtos; pre?os e compra indispon?veis nesta pr?via">' + render('snipplets/home/home-featured-products.tpl',homeContext) + '</section>');
fs.writeFileSync(path.join(out,'vendor.js'),read('static/js/external-no-dependencies.js.tpl').replace(/\{#[\s\S]*?#\}/g,''));

// Public store content copied locally for design review; no production credentials.
const moduleFixture = JSON.parse(fs.readFileSync(path.join(local, 'module-fixture.json'), 'utf8'));
for (const slide of moduleFixture.slides) {
  fs.copyFileSync(path.join(local, 'public', slide.image), path.join(out, path.basename(slide.image)));
}
const moduleMarkup = render('snipplets/home/home-modules.tpl', {
  ...context,
  settings: { ...settings, module: moduleFixture.slides, module_title: moduleFixture.title },
});
const previewHomePath = path.join(out, 'home.html');
fs.writeFileSync(previewHomePath, fs.readFileSync(previewHomePath, 'utf8').replace('<section id="vitrine"', moduleMarkup + '<section id="vitrine"'));
const footerMarkup = render('snipplets/footer/footer.tpl', {
  ...homeContext,
  settings: { ...homeContext.settings, payments: false, shipping: false },
  menus: { navigation },
  contact: {},
  has_products: true,
});
fs.appendFileSync(previewHomePath, footerMarkup);
