{# TRACK FOR — Editorial geometry: header, hero and primary showcase only.
   Colors, image proportions, content and section order remain panel-owned. #}
.category-body .tf-shipping-label,
.template-home .item-product .tf-shipping-label { display: none !important; }

/* Privacy acknowledgement: native checkbox, visible keyboard focus and readable links. */
.tf-privacy-check {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  margin: 16px 0;
  text-align: left;
  font-family: var(--body-font);
  font-size: 13px;
  line-height: 1.6;
  letter-spacing: normal;
  text-transform: none;
  cursor: pointer;
}
.tf-privacy-check .tf-privacy-input {
  appearance: auto;
  -webkit-appearance: checkbox;
  position: static;
  display: block;
  flex: 0 0 18px;
  width: 18px;
  height: 18px;
  margin: 2px 0 0;
  opacity: 1;
  accent-color: #292929;
  cursor: pointer;
}
.tf-privacy-check a { color: inherit; text-decoration: underline; text-underline-offset: 3px; }
.tf-privacy-check input:focus-visible,
.tf-privacy-check a:focus-visible { outline: 2px solid currentColor; outline-offset: 4px; }
.tf-footer-newsletter form { display: flex; flex-direction: column; }
.tf-footer-newsletter .tf-privacy-check { order: 2; margin-bottom: 0; color: #333; }

/* Keep the policy's legal content intact; improve only its reading layout. */
.tf-privacy-page { max-width: 960px; margin: 0 auto; padding: 24px 24px 48px; }
.tf-privacy-page .page-header { margin-bottom: 24px; }
.tf-privacy-page .page-header .container-fluid,
.tf-privacy-page .user-content .container { padding-left: 0; padding-right: 0; }
.tf-privacy-page .page-header h1,
.tf-privacy-page .page-header .h1 { font-size: clamp(28px, 4vw, 42px); line-height: 1.2; }
.tf-privacy-page .user-content .col-md-8 { flex: 0 0 100%; max-width: 100%; }
.tf-privacy-page .user-content { font-size: 16px; line-height: 1.8; overflow-wrap: anywhere; }
.tf-privacy-page .user-content p { margin-bottom: 20px; }
.tf-privacy-page .user-content h2,
.tf-privacy-page .user-content h3 { font-size: 23px; line-height: 1.4; margin: 32px 0 16px; }
.tf-privacy-page .user-content mark,
.tf-privacy-page .user-content [style*="background"] { background: transparent !important; color: inherit !important; }
.tf-privacy-page .user-content a { text-decoration: underline; text-underline-offset: 3px; }
.tf-privacy-contact { border-top: 1px solid rgba(127,127,127,.25); padding-top: 24px; font-size: 14px; line-height: 1.7; }
.tf-privacy-contact a { color: inherit; text-decoration: underline; }
.tf-support-navigation { display: flex; flex-wrap: wrap; gap: 8px 24px; margin-bottom: 24px; border-bottom: 1px solid #ddd8cf; }
.tf-support-navigation a { display: inline-flex; align-items: center; min-height: 44px; font-size: 13px; color: #514a3e; text-decoration: none; border-bottom: 2px solid transparent; }
.tf-support-navigation a:hover, .tf-support-navigation a[aria-current="page"] { color: #29251f; border-bottom-color: #966a2f; }
.tf-support-navigation a:focus-visible, .tf-contact-layout a:focus-visible { outline: 2px solid #966a2f; outline-offset: 3px; }
.tf-support-page, .tf-contact-layout { color: #29251f; }
.tf-support-page .user-content { background: #fff; padding: 28px 32px !important; border-top: 2px solid #966a2f; margin-bottom: 24px; }
.tf-support-page .user-content ul, .tf-support-page .user-content ol { padding-left: 24px; }
.tf-support-page .user-content li { margin-bottom: 10px; }
.tf-support-page .user-content a { color: #725020; }
.tf-returns-page .user-content img { display: block; width: auto; max-width: 100%; height: auto; max-height: 420px; object-fit: contain; margin: 0 auto 24px; }
.tf-returns-page .user-content h1 { font-size: clamp(20px, 2.4vw, 28px); line-height: 1.4; margin: 0 0 24px; }
.tf-contact-layout { max-width: 1120px; margin: 0 auto; padding: 24px 24px 40px; }
.tf-contact-layout .page-header { margin-bottom: 24px; }
.tf-contact-layout .page-header .container-fluid, .tf-contact-layout .contact-page > .container-fluid { padding: 0; }
.tf-contact-layout .page-header h1 { font-size: clamp(28px, 4vw, 42px); line-height: 1.2; }
.tf-contact-layout .contact-page > .container-fluid > .row { margin: 0; gap: 32px; align-items: start; }
.tf-contact-layout .contact-page > .container-fluid > .row > .col-md-3 { flex: 1 1 280px; max-width: none; padding: 20px 0; }
.tf-contact-layout .tf-contact-form-panel { flex: 1.5 1 340px; max-width: none; min-width: 0; padding: 28px; background: #fff; border-top: 2px solid #966a2f; }
.tf-contact-subtitle { font-family: var(--body-font); font-size: 19px; font-weight: 500; line-height: 1.4; margin: 0 0 24px; }
.tf-contact-layout .contact-info { list-style: none; padding: 0; margin: 0; }
.tf-contact-layout .contact-info li { padding: 12px 0; margin: 0; font-size: 15px; line-height: 1.7; overflow-wrap: anywhere; }
.tf-contact-layout .contact-info a { color: #725020; text-decoration: underline; text-underline-offset: 4px; }
.tf-contact-layout .form-control { background: #faf9f6; border: 1px solid #b8b1a6; color: #29251f; border-radius: 4px; min-height: 48px; font-size: 16px; }
.tf-contact-layout .form-control:focus { border-color: #725020; outline: 2px solid #725020; outline-offset: 2px; }
.tf-contact-layout textarea.form-control { min-height: 144px; resize: vertical; }
.tf-contact-layout button[type="submit"] { background: #29251f; color: #fff; border: 1px solid #29251f; min-height: 48px; }
@media (max-width: 767px) {
  .tf-contact-layout { padding: 16px 20px 28px; }
  .tf-contact-layout .contact-page > .container-fluid > .row { gap: 16px; }
  .tf-contact-layout .tf-contact-form-panel { flex-basis: 100%; padding: 20px 16px; }
  .tf-support-page .user-content { padding: 24px 16px !important; }
  .tf-support-navigation { gap: 4px 16px; margin-bottom: 16px; }
}
@media (max-width: 767px) {
  .tf-privacy-page { padding: 16px 20px 32px; }
  .tf-privacy-page .user-content { font-size: 15px; }
}
.tf-header .nav-desktop-list > .nav-item > .nav-list-link,
.tf-header .nav-desktop-list > .nav-item > .nav-item-container > .nav-list-link {
  font-size: max(12px, var(--font-small));
  font-weight: 400;
  letter-spacing: .065em;
  text-transform: uppercase;
}
.tf-header .logo-img-container { vertical-align: middle; }
.tf-header .utilities-icon { font-size: 20px; }
.tf-header .desktop-list-subitems { text-align: left; }
.tf-header .desktop-dropdown-small {
  left: auto;
  right: 0;
  top: 100%;
  transform: none;
}
.tf-header .logo-text-container { margin: 8px 0; }
.tf-header .logo-img { max-height: 50px; margin: 6px 0; }
.tf-header .logo-text { font-size: clamp(17px, 1.6vw, 23px); margin: 0; }
.tf-header .nav-desktop-list { padding-top: 0; padding-bottom: 0; }
.tf-campaign-link, .tf-campaign-picture { display: block; width: 100%; }
.tf-campaign-hero .tf-campaign-image { display: block; position: static; width: 100%; height: auto; aspect-ratio: 1580 / 600; object-fit: contain; }
.tf-campaign-controls { display: flex; align-items: center; justify-content: center; gap: 12px; padding: 12px 0; }
.tf-campaign-link:focus-visible { outline: 3px solid currentColor; outline-offset: -3px; }
@media (max-width: 767px) {
  .tf-campaign-hero .tf-campaign-image { aspect-ratio: 820 / 1000; }
}
.tf-home-hero {
  position: relative;
  --tf-hero-height: 80vh;
  --tf-hero-height: 80svh;
}
/* Reserve the native controls' 44px target and vertical margins. */
.tf-home-hero .slider-slide { height: calc(var(--tf-hero-height) - 76px); }
.tf-home-hero .slider-image { height: 100%; object-fit: cover; object-position: center; }
.tf-hero-outside .slider-slide > .row { height: 100%; }
.tf-hero-outside .slider-slide > .row > div:first-child { height: 100%; }
.tf-home-hero .swiper-text-center {
  width: calc(100% - 40px);
  max-width: 900px;
  top: auto;
  bottom: 8%;
  padding: 0;
  transform: translateX(-50%);
}
.tf-home-hero .swiper-text-center .h1-huge {
  font-size: clamp(26px, 4.5vw, 64px);
  line-height: 1.06;
  letter-spacing: -.035em;
  text-wrap: balance;
  overflow-wrap: anywhere;
}
.tf-home-hero .swiper-text-center p {
  max-width: 520px;
  margin-right: auto;
  margin-left: auto;
  font-size: max(14px, var(--font-base));
  line-height: 1.6;
}
.tf-home-hero .btn {
  min-height: 44px;
  padding: 15px 28px;
  font-size: 12px;
  letter-spacing: .12em;
  line-height: 1.2;
  text-transform: uppercase;
}
.tf-home-hero .swiper-button-prev,
.tf-home-hero .swiper-button-next,
.tf-featured .swiper-button-prev,
.tf-featured .swiper-button-next {
  width: 44px;
  height: 44px;
  line-height: 42px;
  text-align: center;
  border: 1px solid currentColor;
  border-radius: var(--border-radius-half);
  background-image: none;
  vertical-align: middle;
  cursor: pointer;
}
.tf-home-hero .swiper-pagination-fraction,
.tf-featured .swiper-pagination-fraction {
  min-width: 62px;
  padding: 0 12px;
  font-size: 12px;
  letter-spacing: .12em;
  font-variant-numeric: tabular-nums;
  vertical-align: middle;
}
.tf-hero-outside .swiper-text {
  position: relative;
  bottom: auto;
  padding: 28px 20px;
}
.tf-hero-outside .swiper-text .h1-huge {
  font-size: clamp(26px, 3vw, 46px);
  line-height: 1.1;
  letter-spacing: -.035em;
  overflow-wrap: anywhere;
}
.tf-editorial-module { padding: 16px 0 20px; }
.tf-editorial-module > .container-fluid { max-width: 1600px; padding: 0 24px; }
.tf-edit-heading { margin: 0 0 16px; font-size: clamp(22px, 2.2vw, 34px); line-height: 1.2; }
.tf-edit-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 16px 12px; }
.tf-edit-card { min-width: 0; position: relative; }
.tf-edit-link { display: block; height: 100%; color: inherit; }
.tf-edit-media { position: relative; aspect-ratio: 1 / 1; overflow: hidden; background: rgba(127,127,127,.06); }
.tf-edit-image { display: block; position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; object-position: center top; }
.tf-edit-caption { padding-top: 12px; }
.tf-edit-title { margin: 0; font-family: var(--body-font); font-size: 15px; font-weight: 400; line-height: 1.4; }
.tf-edit-arrow { display: inline-block; padding-left: 10px; opacity: .5; }
.tf-edit-description { margin: 8px 0 0; font-size: 13px; line-height: 1.5; }
.tf-edit-cta { display: inline-block; margin-top: 10px; font-size: 12px; text-decoration: underline; text-underline-offset: 4px; }
.tf-edit-lead { grid-column: 1 / -1; }
.tf-edit-lead .tf-edit-media { aspect-ratio: 1 / 1; }
.tf-edit-lead .tf-edit-caption { position: absolute; inset: auto 0 0; padding: 64px 24px 24px; color: #fff; background: linear-gradient(transparent, rgba(0,0,0,.65)); }
.tf-edit-lead .tf-edit-title { font-family: var(--heading-font); font-size: clamp(28px, 3vw, 42px); line-height: 1.15; }
@media (min-width: 768px) {
  .tf-editorial-module { padding: 20px 0 24px; }
  .tf-editorial-module > .container-fluid { padding: 0 40px; }
  .tf-edit-grid { grid-template-columns: minmax(0, 1.25fr) minmax(0, 1fr); gap: 16px; }
  .tf-edit-count-medium { grid-template-columns: minmax(0, 1.8fr) repeat(2, minmax(0, 1fr)); }
  .tf-edit-count-large { grid-template-columns: minmax(0, 2.4fr) repeat(3, minmax(0, 1fr)); }
  .tf-edit-lead { grid-column: 1; grid-row: span 2; min-height: 300px; }
  .tf-edit-lead .tf-edit-media { height: 100%; min-height: 300px; aspect-ratio: auto; }
  .tf-edit-count-small .tf-edit-media { aspect-ratio: 5 / 2; }
  .tf-edit-count-small .tf-edit-lead .tf-edit-media { aspect-ratio: auto; }
}
.tf-featured { padding-top: 20px; padding-bottom: 20px; }
.tf-featured h2 {
  font-size: clamp(28px, 3.2vw, 48px);
  line-height: 1.1;
  letter-spacing: -.035em;
  overflow-wrap: anywhere;
}
.tf-featured .absolute-section-title {
  position: relative;
  top: auto;
  right: auto;
  width: 100%;
  padding: 0;
  text-align: left;
}
.tf-featured .item-asymmetric { width: 92%; }
.tf-featured .item-description { padding: 18px 2px 24px; }
.tf-featured .item-name {
  min-height: 2.8em;
  font-size: max(14px, var(--font-base));
  line-height: 1.4;
  letter-spacing: .01em;
}
.tf-featured .item-price-container { line-height: 1.6; }
.tf-featured .item-price {
  font-size: max(16px, var(--font-big));
  font-weight: 700;
  font-variant-numeric: tabular-nums;
}
.tf-featured .price-compare {
  font-size: max(12px, var(--font-small));
  opacity: .7;
  white-space: nowrap;
}
.tf-featured .item-installments {
  margin-top: 6px;
  font-size: max(12px, var(--font-small));
  line-height: 1.5;
}
.tf-featured .item-image { isolation: isolate; }
.tf-featured .item-actions { height: 44px; }
.tf-featured .item .item-btn-quickshop,
.tf-featured .item-submit-container.btn {
  width: 44px;
  height: 44px;
  line-height: 44px;
}
.tf-featured .item-quickshop-icon { top: 14px; right: 14px; font-size: 16px; }
/* Primary showcase: editorial heading and a quiet, aligned product rail. */
.tf-occasion { max-width: 1600px; padding: 16px 24px; }
.tf-occasion h2 {
  font-family: Georgia, 'Times New Roman', serif;
  font-size: clamp(36px, 5.5vw, 76px);
  font-weight: 400;
  line-height: 1.04;
  letter-spacing: -.045em;
  margin-bottom: 24px !important;
}
.tf-occasion-categories { display: flex; flex-wrap: wrap; gap: 12px 28px; margin: 0 0 16px; }
.tf-occasion-categories:empty { display: none; }
.tf-occasion-categories a { display: inline-flex; align-items: center; min-height: 44px; font-size: 14px; color: inherit; text-underline-offset: 5px; }
.tf-occasion-categories a:hover { text-decoration: underline; }
.tf-occasion-controls { display: flex; align-items: center; justify-content: flex-end; gap: 8px; }
.tf-editorial-pair { display: grid; grid-template-columns: minmax(0, 1fr) minmax(0, 1fr); max-width: 1600px; margin: 8px auto 24px; }
.tf-pair-campaign { position: relative; min-width: 0; height: clamp(280px, 30vw, 420px); overflow: hidden; }
.tf-pair-campaign-link { display: block; height: 100%; }
.tf-pair-image { display: block; width: 100%; height: 100%; object-fit: cover; object-position: center top; }
.tf-pair-caption { position: absolute; inset: auto 0 0; padding: 96px 32px 40px; color: #fff; background: linear-gradient(transparent, rgba(0,0,0,.55)); font-family: var(--heading-font); font-size: clamp(28px, 3.3vw, 48px); line-height: 1.1; text-align: center; pointer-events: none; }
.tf-pair-products { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); align-content: center; gap: 12px; padding: 16px 24px; min-width: 0; }
.tf-pair-products > .item-product { width: 100%; max-width: none; padding: 0; margin: 0; }
.tf-pair-products .item { margin: 0; padding: 0; }
.tf-pair-products .item-image { aspect-ratio: 1 / 1; background: rgba(127,127,127,.06); border-radius: 0; }
.tf-pair-products .js-item-image-padding { height: 100%; padding-bottom: 0 !important; }
.tf-pair-products .item-image > a { height: 100%; }
.tf-pair-products .item-image img { width: 100%; height: 100% !important; object-fit: contain; }
.tf-pair-products .item-description { padding: 16px 0; text-align: center; }
.tf-pair-products .item-name { font-size: 14px; line-height: 1.5; }
.tf-pair-products .item-price { font-size: 15px; }
.tf-editorial-pair a:focus-visible { outline: 2px solid currentColor; outline-offset: -3px; }
.tf-wide-campaign { position: relative; width: 100%; aspect-ratio: 4 / 1; min-height: 240px; margin: 0 0 20px; overflow: hidden; color: #fff; background: #292a27; }
.tf-wide-campaign-link { display: block; position: relative; width: 100%; height: 100%; min-height: inherit; color: inherit; }
.tf-wide-campaign-image { position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; object-position: center 25%; }
.tf-wide-campaign::after { content: ''; position: absolute; inset: 0; pointer-events: none; background: linear-gradient(90deg, rgba(0,0,0,.28), transparent 70%), linear-gradient(0deg, rgba(0,0,0,.22), transparent 50%); }
.tf-wide-campaign-copy { position: absolute; z-index: 1; top: 50%; left: 8%; width: 48%; transform: translateY(-50%); }
.tf-wide-campaign-copy h2 { margin: 0; font-family: Georgia, 'Times New Roman', serif; font-style: italic; font-size: clamp(40px, 5.5vw, 88px); font-weight: 400; line-height: 1.1; letter-spacing: -.025em; text-wrap: balance; overflow-wrap: anywhere; }
.tf-wide-campaign-copy p { margin: 16px 0 0; max-width: 440px; font-size: 16px; line-height: 1.5; }
.tf-wide-campaign-cta { position: absolute; z-index: 1; right: 12%; bottom: 14%; display: inline-flex; align-items: center; gap: 14px; min-height: 44px; font-size: 15px; font-style: italic; letter-spacing: .04em; text-decoration: underline; text-underline-offset: 5px; }
.tf-wide-campaign-dark { color: #171717; }
.tf-wide-campaign-dark::after { background: linear-gradient(90deg, rgba(255,255,255,.32), transparent 70%); }
.tf-wide-campaign-link:focus-visible { outline: 3px solid currentColor; outline-offset: -6px; }
.tf-closing-tiles { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 12px; max-width: 1600px; margin: 16px auto 0; padding: 0 40px; }
.tf-closing-tile { position: relative; min-width: 0; aspect-ratio: 3 / 2; overflow: hidden; background: rgba(127,127,127,.08); color: #fff; }
.tf-closing-tile:only-child { grid-column: 1 / -1; aspect-ratio: 2 / 1; }
.tf-closing-tile-link { display: block; height: 100%; color: inherit; }
.tf-closing-tile-image { display: block; width: 100%; height: 100%; object-fit: cover; object-position: center top; }
.tf-closing-tile-title { position: absolute; inset: auto 0 0; margin: 0; padding: 72px 24px 28px; font-family: var(--body-font); font-size: clamp(24px, 3vw, 44px); font-weight: 400; letter-spacing: .045em; line-height: 1.2; text-transform: uppercase; text-align: center; overflow-wrap: anywhere; background: linear-gradient(transparent, rgba(0,0,0,.5)); pointer-events: none; }
.tf-closing-tile-dark { color: #171717; }
.tf-closing-tile-dark .tf-closing-tile-title { background: linear-gradient(transparent, rgba(255,255,255,.6)); }
.tf-closing-tile-link:focus-visible { outline: 3px solid currentColor; outline-offset: -6px; }
.tf-footer { border-top: 1px solid rgba(127,127,127,.2); margin-top: 28px !important; padding-top: 0; background: #f7f7f6; color: #202020; }
/* Compatibility with cached footer markup: never wait for async CSS to reveal it. */
.tf-footer.display-when-content-ready { display: block !important; }
.tf-footer a, .tf-footer .footer-legal { color: inherit; }
.tf-footer .footer-legal { background: transparent; }
.tf-footer > .container-fluid, .tf-footer .footer-legal > .container-fluid { max-width: 1600px; padding-left: 40px; padding-right: 40px; }
.tf-footer-newsbar { padding: 20px 0; background: rgba(127,127,127,.09); }
.tf-footer-newsbar > .container-fluid { max-width: 1600px; padding: 0 40px; }
.tf-footer-newsletter { display: grid; grid-template-columns: minmax(200px, 1fr) minmax(0, 2.4fr); align-items: center; gap: 32px; }
.tf-newsletter-intro h2 { font-family: var(--body-font); font-size: 20px; font-weight: 400; line-height: 1.3; margin: 0; }
.tf-newsletter-form { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)) auto; gap: 16px; align-items: center; }
.tf-footer .tf-newsletter-form .form-control { width: 100%; min-width: 0; margin: 0; padding: 12px 0; border: 0; border-bottom: 1px solid currentColor; background: transparent; font-size: 14px; }
.tf-footer .tf-newsletter-submit { position: static; width: auto; padding: 12px 24px; opacity: 1; font-size: 14px; border-radius: 0; }
.tf-footer-columns { padding-top: 28px; padding-bottom: 12px; margin-bottom: 24px !important; row-gap: 20px; }
.tf-footer-links { flex: 1 1 0%; max-width: none; }
.tf-footer-socials { order: 2; flex: 0 0 20%; max-width: 20%; }
.tf-footer-heading { font-family: var(--body-font); font-size: 15px; font-weight: 600; line-height: 1.4; margin: 0 0 24px; }
.tf-footer .social-icon { display: inline-flex; align-items: center; justify-content: center; min-width: 44px; min-height: 44px; }
.tf-social-cards { display: flex; flex-wrap: wrap; gap: 12px; }
.tf-footer .tf-social-card {
  --social-highlight: #966a2f;
  position: relative;
  display: grid;
  place-items: center;
  width: 60px;
  height: 64px;
  overflow: hidden;
  isolation: isolate;
  color: var(--social-highlight);
  background: #fff;
  border: 1px solid rgba(40,40,35,.12);
  border-radius: 12px;
  box-shadow: 0 3px 8px rgba(40,40,35,.04);
  transition: transform .2s ease, border-color .2s ease, box-shadow .2s ease;
}
.tf-footer .tf-social-card-instagram { --social-highlight: #c62e50; }
.tf-footer .tf-social-card-whatsapp { --social-highlight: #167c40; }
.tf-social-card-icon { position: relative; display: flex; z-index: 1; }
.tf-social-card-icon svg { width: 25px; height: 25px; fill: currentColor; }
.tf-social-card-glow { position: absolute; inset: 0; background: radial-gradient(ellipse at 50% 100%, currentColor, transparent 75%); opacity: .08; transition: opacity .2s ease; pointer-events: none; }
.tf-social-card-beam { position: absolute; bottom: 0; left: 22%; right: 22%; height: 2px; background: currentColor; box-shadow: 0 -3px 12px currentColor; opacity: .5; transition: opacity .2s ease; pointer-events: none; }
.tf-footer .tf-social-card:focus-visible { outline: 2px solid currentColor; outline-offset: 4px; border-color: currentColor; }
.tf-social-card:focus-visible .tf-social-card-glow { opacity: .22; }
@media (hover: hover) {
  .tf-footer .tf-social-card:hover { color: var(--social-highlight); transform: translateY(-3px); border-color: currentColor; box-shadow: 0 6px 14px rgba(40,40,35,.09); }
  .tf-social-card:hover .tf-social-card-glow { opacity: .22; }
  .tf-social-card:hover .tf-social-card-beam { opacity: 1; }
}
@media (prefers-reduced-motion: reduce) {
  .tf-footer .tf-social-card, .tf-social-card-glow, .tf-social-card-beam { transition: none; }
  .tf-footer .tf-social-card:hover { transform: none; }
}
.tf-footer .contact-info { font-size: 13px; line-height: 1.6; overflow-wrap: anywhere; }
.tf-footer .footer-menu-link { display: inline-flex; align-items: center; min-height: 32px; font-size: 13px; line-height: 1.5; }
.tf-footer .newsletter .form-control { min-height: 48px; border-radius: 0; }
.tf-footer .newsletter input[type="submit"] { min-height: 48px; }
.tf-footer .footer-legal { padding: 24px 0; border-top: 1px solid rgba(127,127,127,.2); line-height: 1.7; }
.tf-footer a:focus-visible, .tf-footer input:focus-visible { outline: 2px solid currentColor; outline-offset: 3px; }
@media (max-width: 767px) {
  .tf-closing-tiles { padding: 0 16px; gap: 16px; grid-template-columns: minmax(0, 1fr); margin-top: 24px; }
  .tf-closing-tile, .tf-closing-tile:only-child { aspect-ratio: 5 / 4; }
  .tf-closing-tile-title { padding-bottom: 24px; }
  .tf-footer > .container-fluid, .tf-footer .footer-legal > .container-fluid { padding-left: 24px; padding-right: 24px; }
  .tf-footer .footer-menu-link, .tf-footer .js-accordion-toggle-mobile { min-height: 44px; }
  .tf-footer-newsbar > .container-fluid { padding: 0 24px; }
  .tf-footer-newsletter { grid-template-columns: 1fr; gap: 20px; }
  .tf-newsletter-form { grid-template-columns: 1fr; gap: 12px; }
  .tf-footer-links, .tf-footer-socials { flex: 0 0 100%; max-width: 100%; }
  .tf-footer-heading { margin-bottom: 12px; }
}
@media (min-width: 768px) and (max-width: 1100px) {
  .tf-footer-newsletter { grid-template-columns: 1fr; gap: 20px; }
}
.tf-testimonials.section-testimonials-home { padding: 24px 0; margin: 0; background: #eeeee8; color: #282823; border-radius: 0; }
.tf-testimonials > .container { max-width: 1200px; padding: 0 32px; }
.tf-testimonials h2 { font-family: var(--heading-font); font-size: clamp(26px, 3vw, 36px); line-height: 1.2; text-transform: none; text-align: center; }
.tf-testimonials > .container > .row > [class*="col-"] { flex: 0 0 100%; max-width: 100%; }
.tf-testimonials .swiper-testimonials { padding: 12px 8px 16px; }
.tf-testimonials .swiper-wrapper { align-items: center; }
.tf-testimonials .slide-container { height: auto; margin-top: 0 !important; padding: 0 !important; }
.tf-testimonial-card { display: flex; flex-direction: column; align-items: center; padding: 24px; background: #fff; border: 1px solid rgba(40,40,35,.06); border-radius: 12px; box-shadow: 0 6px 16px rgba(40,40,35,.09); text-align: center; }
.tf-testimonial-mark { display: grid; place-items: center; width: 40px; height: 40px; margin-bottom: 16px; border-radius: 50%; background: #eeeee8; color: #74725c; font: 48px/1 Georgia, serif; padding-top: 8px; }
.tf-testimonial-quote { margin: 0; font-family: var(--body-font); font-size: 15px; font-weight: 400; line-height: 1.65; overflow-wrap: anywhere; }
.tf-testimonials .tf-testimonial-author { margin: 20px 0 0; font-family: var(--body-font); font-size: 12px; font-weight: 600; line-height: 1.5; letter-spacing: .01em; text-transform: none; }
.tf-testimonial-original { display: inline-flex; align-items: center; gap: 6px; min-height: 44px; margin-top: 6px; color: #625f4d; font-size: 12px; text-decoration: underline; text-underline-offset: 3px; }
.tf-testimonial-original:focus-visible { outline: 2px solid currentColor; outline-offset: 3px; }
.tf-testimonial-proof { width: 100%; height: 160px; object-fit: contain; margin-top: 12px; }
@media (max-width: 767px) {
  .tf-testimonials.section-testimonials-home { padding: 20px 0; }
  .tf-testimonials > .container { padding: 0 24px; }
  .tf-testimonial-card { padding: 24px 20px; }
}
@media (max-width: 767px) {
  .tf-wide-campaign { aspect-ratio: 3 / 2; min-height: 240px; margin-bottom: 16px; }
  .tf-wide-campaign-copy { top: auto; bottom: 110px; left: 24px; width: calc(100% - 48px); transform: none; }
  .tf-wide-campaign-cta { right: auto; left: 24px; bottom: 32px; }
  .tf-wide-campaign::after { background: linear-gradient(0deg, rgba(0,0,0,.6), transparent 75%); }
  .tf-wide-campaign-dark::after { background: linear-gradient(0deg, rgba(255,255,255,.7), transparent 75%); }
}
@media (max-width: 767px) {
  .tf-editorial-pair { grid-template-columns: minmax(0, 1fr); margin-bottom: 24px; }
  .tf-pair-campaign { height: auto; aspect-ratio: 5 / 4; }
  .tf-pair-products { padding: 16px; gap: 12px; }
}
.tf-occasion .item { margin-top: 0 !important; padding-top: 0 !important; }
.tf-occasion .item-image { aspect-ratio: 1 / 1; background: rgba(127,127,127,.06); border-radius: 0; }
.tf-occasion .js-item-image-padding { height: 100%; padding-bottom: 0 !important; }
.tf-occasion .item-image > a { height: 100%; }
.tf-occasion .item-image img { width: 100%; height: 100% !important; object-fit: contain; }
.tf-occasion .item-description { padding: 12px 2px 16px; text-align: left; }
.tf-occasion .item-name { min-height: 0; font-size: 14px; font-weight: 400; line-height: 1.5; }
.tf-occasion .item-price { font-size: 15px; font-weight: 600; }
.tf-occasion .item-installments { font-size: 12px; }
.tf-occasion .swiper-button-prev,
.tf-occasion .swiper-button-next { border-radius: 50%; border-color: rgba(127,127,127,.2); }
@media (min-width: 768px) {
  .tf-featured.tf-occasion { padding: 20px 40px; }
}
@media (max-width: 767px) {
  .tf-header .logo-img { max-height: 36px; margin: 6px 0; }
  .tf-home-hero:not(.tf-hero-outside) .slider-slide {
    display: grid;
    grid-template-rows: minmax(0, 1fr) auto;
  }
  .tf-home-hero:not(.tf-hero-outside) .slider-image { min-height: 0; }
  .tf-hero-outside .slider-slide { height: auto; }
  .tf-hero-outside .slider-image { height: calc(var(--tf-hero-height) - 300px); min-height: 120px; }
  /* Text below the image keeps long real campaign copy readable without cropping. */
  .tf-home-hero:not(.tf-hero-outside) .swiper-text-center {
    position: relative;
    left: auto;
    top: auto;
    bottom: auto;
    width: 100%;
    padding: 20px;
    transform: none;
    color: inherit;
  }
  .tf-home-hero:not(.tf-hero-outside) .swiper-overlay { display: none; }
  .tf-featured .item-asymmetric { width: 100%; }
  .tf-featured .item-description { padding-top: 14px; }
  .tf-featured h2 { margin-bottom: 24px; }
}
@media (min-width: 768px) {
  .tf-featured { padding-top: 40px; padding-bottom: 40px; }
  .tf-hero-outside .slider-slide > .row { align-items: center; }
  .tf-header .nav-desktop-list { padding-top: 0; padding-bottom: 0; }
}

/* Compact shopping navigation and section rhythm; hero geometry stays unchanged. */
.tf-header .nav-list-link, .tf-header .utilities-item, .tf-header .cart-summary > a { color: #25231f; }
.tf-header .nav-list-link.selected, .tf-header .nav-list-link:hover { color: #966a2f; }
.tf-header .search-input { border-color: rgba(37,35,31,.25); color: #25231f; font-size: 13px; }
.tf-header .search-input::placeholder { color: #716b62; opacity: 1; }
.tf-header .cart-summary > a { display: inline-flex; align-items: center; justify-content: center; min-width: 44px; min-height: 44px; }
.tf-header .cart-summary .badge { min-width: 16px; height: 16px; font-size: 10px; line-height: 16px; background: #966a2f; color: white; }
.tf-editorial-module { padding-top: 20px; padding-bottom: 20px; }
.tf-featured.tf-occasion { padding-top: 20px; padding-bottom: 20px; }
.tf-editorial-pair { margin-top: 8px; margin-bottom: 20px; }
.tf-wide-campaign { margin-bottom: 20px; }
.tf-closing-tiles { margin-top: 16px; }
.tf-testimonials.section-testimonials-home { padding-top: 24px; padding-bottom: 24px; }
.tf-footer { margin-top: 20px !important; }
@media (min-width: 768px) {
  .tf-header .search-container { width: clamp(160px, 16vw, 230px); }
  .tf-header .nav-desktop-list > .nav-item > .nav-list-link,
  .tf-header .nav-desktop-list > .nav-item > .nav-item-container > .nav-list-link { padding-left: 14px; padding-right: 14px; }
}
@media (max-width: 767px) {
  .tf-header .tf-header-actions .utilities-container { margin-left: 4px; margin-right: 0; }
  .tf-header .utilities-item { min-width: 40px; min-height: 44px; }
}

/* Brand masthead and direct catalog navigation. */
.tf-shipping-announcement { display: block; width: 100%; padding: 8px 16px; background: #25231f; color: #fff; font: 500 11px/1.4 var(--body-font); letter-spacing: .1em; text-align: center; text-transform: uppercase; }
.tf-header .tf-nav-promotions > .nav-list-link { color: #966a2f; font-weight: 700; }
.tf-header .nav-desktop { border-top: 1px solid rgba(127,127,127,.14); }
.tf-header .nav-desktop-list { display: flex; justify-content: safe center; align-items: center; }
.tf-header .nav-desktop-list > .nav-item { flex-shrink: 0; }
.tf-mobile-categories { display: flex; align-items: center; gap: 20px; margin: 0; padding: 0 0 2px; list-style: none; overflow-x: auto; scrollbar-width: thin; }
.tf-mobile-categories > .nav-item { flex: 0 0 auto; margin: 0; }
.tf-mobile-categories .nav-list-link { display: inline-flex; align-items: center; min-height: 44px; padding: 0; font-size: 11px; letter-spacing: .025em; white-space: nowrap; text-transform: uppercase; }
.tf-mobile-category-nav { border-top: 1px solid rgba(127,127,127,.14); }
@media (min-width: 768px) {
  .tf-header .nav-desktop-list > .nav-item > .nav-list-link { min-height: 44px; padding-top: 12px; padding-bottom: 12px; }
}

/* Social invitation and compact service benefits. Native feed and slider hooks stay intact. */
.tf-instagram.section-instafeed-home { padding: 16px 0 8px; }
.tf-instagram > .container, .tf-benefits > .container { max-width: 1440px; padding-left: 32px; padding-right: 32px; }
.tf-instagram-profile { display: flex; align-items: center; gap: 20px; padding: 16px 24px; border: 1px solid rgba(127,127,127,.2); color: inherit; }
.tf-instagram-icon { display: grid; place-items: center; flex: 0 0 48px; height: 48px; border: 1px solid rgba(127,127,127,.25); border-radius: 50%; }
.tf-instagram .instafeed-title { margin: 0; min-width: 0; }
.tf-instagram .instafeed-title h3 { margin: 0 0 6px; font: 400 11px/1.5 var(--body-font); letter-spacing: .08em; text-transform: uppercase; }
.tf-instagram .instafeed-title h2 { font: 500 clamp(18px, 2.2vw, 28px)/1.3 var(--body-font); overflow-wrap: anywhere; }
.tf-instagram-cta { display: inline-flex; align-items: center; gap: 16px; margin-left: auto; min-height: 44px; flex-shrink: 0; font-size: 13px; text-decoration: underline; text-underline-offset: 4px; }
.tf-instagram-profile:focus-visible { outline: 2px solid currentColor; outline-offset: 3px; }
.tf-instagram .instafeed-grid { margin: 16px -8px 0; }
.tf-instagram .instafeed-post { width: 25%; margin-top: 0; padding: 0 8px; }
.tf-instagram .instafeed-post:nth-child(n+5) { display: none; }
.tf-benefits.section-informative-banners { padding: 16px 0 20px; }
.tf-benefits .service-item-container { height: auto; }
.tf-benefits .service-item { height: 100%; padding: 24px; border: 1px solid rgba(127,127,127,.18); background: rgba(127,127,127,.025); }
.tf-benefits .service-item > a { display: block; color: inherit; }
.tf-benefits .service-item-image { display: block; width: 44px; height: 44px; object-fit: contain; max-height: none; }
.tf-benefits .service-item h3 { font: 600 16px/1.4 var(--body-font); text-transform: none; margin-bottom: 10px !important; }
.tf-benefits .service-item p { font: 400 13px/1.65 var(--body-font); opacity: .8; }
.tf-benefits .service-item a:focus-visible { outline: 2px solid currentColor; outline-offset: 4px; }
@media (max-width: 767px) {
  .tf-instagram > .container, .tf-benefits > .container { padding-left: 20px; padding-right: 20px; }
  .tf-instagram-profile { padding: 20px 16px; gap: 12px; flex-wrap: wrap; }
  .tf-instagram .instafeed-title { flex: 1; }
  .tf-instagram-cta { margin-left: 60px; }
  .tf-instagram .instafeed-post { width: 50%; }
  .tf-benefits.section-informative-banners { padding-top: 16px; padding-bottom: 24px; }
  .tf-benefits .service-item { margin-left: 0 !important; margin-right: 0 !important; padding: 20px; }
}

/* Consistent 3:4 image frames across catalog, category and search listings. */
.category-body .item-product .item { margin-top: 0 !important; padding-top: 0 !important; padding-left: 0 !important; padding-right: 0 !important; }
.category-body .item-image { background: rgba(127,127,127,.045); }
.category-body .item-image .js-item-image-padding { height: 0; padding-bottom: 133.333333% !important; }
.category-body .item-image img { width: 100%; height: 100%; max-height: none; object-fit: contain; object-position: center; }
