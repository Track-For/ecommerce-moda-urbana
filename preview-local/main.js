// Local interaction adapter. Never executes LS, cart requests, tracking or store scripts.
const root = document.querySelector('#header-root');
document.addEventListener('submit', event => {
  if (event.target.closest('.tf-footer')) {
    event.preventDefault();
    document.querySelector('#preview-status').textContent = 'Newsletter simulada: nenhum dado foi enviado.';
  }
});
document.addEventListener('click', event => {
  const toggle = event.target.closest('.tf-footer .js-accordion-toggle-mobile');
  if (!toggle || innerWidth >= 768) return;
  event.preventDefault();
  const content = toggle.parentElement.querySelector('.js-accordion-content');
  if (content) content.style.display = getComputedStyle(content).display === 'none' ? 'block' : 'none';
});
let before = false;
let opener;
const status = message => { document.querySelector('#preview-status').textContent = message; setTimeout(() => document.querySelector('#preview-status').textContent = '', 5000); };
function compare() {
  root.querySelector('header')?.classList.toggle('tf-header', !before);
  root.querySelectorAll('#nav-hamburger,#nav-search').forEach(el => el.classList.toggle('tf-header-panel', !before));
  document.querySelectorAll('[data-preview-hero]').forEach(el => el.classList.toggle('tf-home-hero',!before));
  document.querySelectorAll('[data-preview-featured]').forEach(el => el.classList.toggle('tf-featured',!before));
  document.querySelector('#compare').textContent = before ? 'Ver alterações' : 'Ver antes';
}
async function load() {
  const theme = document.querySelector('link[rel="stylesheet"]');
  theme.href = `/generated/theme-${document.querySelector('#layout').value}.css`;
  document.querySelectorAll('link[href="/generated/critical.css"],link[href="/generated/colors.css"],link[href="/generated/async.css"]').forEach(el=>el.remove());
  root.innerHTML = await (await fetch(`/generated/header-${document.querySelector('#layout').value}.html`)).text();
  document.body.classList.remove('overflow-none');
  root.querySelectorAll('.js-desktop-nav-col,.js-desktop-search-cart-col').forEach(el => { el.style.visibility = 'visible'; el.style.height = 'auto'; });
  root.querySelectorAll('.js-modal-close:not(a[href]):not(button)').forEach(el => { el.tabIndex = 0; el.setAttribute('role','button'); });
  compare();
}
function close() {
  root.querySelectorAll('.js-modal,.js-modal-overlay,.js-menu-panel').forEach(el => { el.style.display = 'none'; el.classList.remove('modal-show','nav-list-panel-show'); });
  document.body.classList.remove('overflow-none'); opener?.focus();
}
document.querySelector('#layout').addEventListener('change',load);
document.querySelector('#compare').addEventListener('click',()=>{before=!before;compare();});
root.addEventListener('click',event=>{
  const el=event.target.closest('a,button,.js-modal-close,.js-modal-overlay'); if(!el)return;
  if(el.matches('.js-modal-close,.js-modal-overlay')){event.preventDefault();close();return;}
  if(el.matches('.js-toggle-menu-back')){event.preventDefault();const panel=el.closest('.js-menu-panel');panel.style.display='none';panel.classList.remove('nav-list-panel-show');return;}
  if(el.matches('.js-toggle-menu-panel')){event.preventDefault();const panel=el.nextElementSibling;panel.style.display='block';requestAnimationFrame(()=>panel.classList.add('nav-list-panel-show'));return;}
  if(el.matches('.js-modal-open')){event.preventDefault();opener=el;const modal=root.querySelector(el.dataset.toggle);if(!modal)return;modal.style.display='block';requestAnimationFrame(()=>modal.classList.add('modal-show'));root.querySelectorAll(`.js-modal-overlay[data-modal-id="${el.dataset.toggle}"]`).forEach(o=>o.style.display='block');document.body.classList.add('overflow-none');modal.querySelector('input,.js-modal-close')?.focus();return;}
  if(el.getAttribute('href')==='#conta'){event.preventDefault();status('Conta simulada: nenhum login ou cadastro será realizado.');return;}
  if(el.getAttribute('href')==='#vitrine')close();
});
document.addEventListener('keydown',event=>{if(event.key==='Escape')close();if(event.key==='Enter'&&event.target.matches('[role="button"].js-modal-close'))event.target.click();});
root.addEventListener('submit',event=>{event.preventDefault();status('Busca simulada: o catálogo real não está conectado.');});
await load();
document.querySelector('#home-root').innerHTML = await (await fetch('/generated/home.html')).text();
// Mirror Cali's visibility hook without executing platform-dependent store.js.
const reveal = new IntersectionObserver(entries=>entries.forEach(entry=>{
  if(entry.isIntersecting){entry.target.classList.add('is-inViewport');reveal.unobserve(entry.target);}
}),{threshold:0.05});
document.querySelectorAll('#home-root [data-transition]').forEach(el=>reveal.observe(el));
document.querySelectorAll('.tf-home-hero').forEach(el=>el.dataset.previewHero='true');
document.querySelectorAll('.tf-featured').forEach(el=>el.dataset.previewFeatured='true');
document.querySelector('.tf-footer')?.classList.remove('display-when-content-ready');
const reducedMotion = matchMedia('(prefers-reduced-motion: reduce)').matches;
// Design-only adapter: product purchase actions remain unavailable locally.
new window.Swiper('.js-swiper-featured', {
  speed: reducedMotion ? 0 : 300,
  slidesPerView: 1.15,
  spaceBetween: 16,
  loop: true,
  breakpoints: { 768: { slidesPerView: 3 }, 1200: { slidesPerView: 5 } },
  navigation: { nextEl: '.js-swiper-featured-next', prevEl: '.js-swiper-featured-prev' },
  pagination: { el: '.js-swiper-featured-pagination', type: 'fraction' },
});
new window.Swiper('.js-home-slider', {
  speed: reducedMotion ? 0 : 300, loop: false, autoplay:false, preloadImages:false, lazy:true,
  pagination:{el:'.js-swiper-home-pagination',type:'fraction'},
  navigation:{nextEl:'.js-swiper-home-next',prevEl:'.js-swiper-home-prev'}
});
