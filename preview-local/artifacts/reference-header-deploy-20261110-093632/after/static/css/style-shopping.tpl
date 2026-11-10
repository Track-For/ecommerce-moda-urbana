/* Shopping refinements: native product, shipping and filter integrations. */
.tf-product-details, .tf-size-help { border-top: 1px solid #dedad3; padding: 18px 0; }
.tf-product-details summary, .tf-size-help summary { cursor: pointer; font-size: 15px; font-weight: 600; line-height: 1.5; }
.tf-product-details .user-content, .tf-size-help p { font-size: 14px; line-height: 1.75; margin: 16px 0 0; max-width: 65ch; overflow-wrap: anywhere; }
.tf-product-details img { max-width: 100%; height: auto; }
.tf-size-help a, .tf-back-to-results { display: inline-block; padding: 12px 0; text-decoration: underline; text-underline-offset: 4px; font-size: 13px; }
.tf-delivery-title { font-size: 16px; font-weight: 600; margin: 0 0 10px; }
.tf-delivery-note { font-size: 13px; line-height: 1.65; margin: 0 0 16px; }
#single-product .page-header h1 { font-size: clamp(25px, 2.6vw, 36px); line-height: 1.2; text-wrap: balance; }
#single-product .price-container { font-variant-numeric: tabular-nums; }
#single-product .js-product-variants-group { margin-bottom: 18px; }
#single-product .btn-variant, .tf-variant-option { min-width: 44px; min-height: 44px; border: 1px solid #b6afa4; border-radius: 2px; cursor: pointer; }
.tf-variant-options { display: flex; flex-wrap: wrap; gap: 8px; margin: 10px 0; }
.tf-native-variant-select { position: absolute !important; width: 1px !important; height: 1px !important; padding: 0 !important; clip-path: inset(50%); overflow: hidden; }
.tf-variant-option { padding: 10px 14px; background: #fff; color: #29251f; font: inherit; font-size: 14px; }
.tf-variant-option[aria-pressed="true"], #single-product .btn-variant.selected { outline: 2px solid #29251f; outline-offset: 2px; }
.tf-variant-option[data-unavailable="true"], #single-product .btn-variant-no-stock { opacity: .45; text-decoration: line-through; }
.tf-variant-status { min-height: 20px; font-size: 13px; line-height: 1.5; margin: 0 0 12px; }
.tf-product-details summary:focus-visible, .tf-size-help summary:focus-visible, .tf-variant-option:focus-visible, #single-product .btn-variant:focus-visible, .tf-sticky-buy button:focus-visible { outline: 2px solid #966a2f; outline-offset: 4px; }
.item-product .item-image .js-item-image-padding { height: 0; padding-bottom: 133.333333% !important; }
.item-product .item-image { aspect-ratio: 3 / 4; background: #f4f2ef; }
.item-product .item-image img { width: 100%; height: 100% !important; max-height: none; object-fit: contain; object-position: center; }
.item-product .item-name { font-size: 14px; line-height: 1.5; font-weight: 500; text-transform: none; letter-spacing: normal; }
#single-product .js-product-slide-link { padding-bottom: 133.333333% !important; background: #f4f2ef; }
#single-product .product-slider-image { width: 100%; height: 100%; max-height: none; object-fit: contain; }
.category-controls a[data-toggle="#nav-filters"], .category-controls a[data-toggle="#sort-by"] { min-height: 44px; padding: 13px 18px; border: 1px solid #b6afa4; text-decoration: none; }
.category-controls a[data-toggle="#nav-filters"] { background: #29251f; color: #fff; }
.filter-chips-container .chip { min-height: 36px; }
.tf-sticky-buy[hidden] { display: none !important; }
.tf-sticky-buy { display: none; }
@media (max-width: 767px) {
  .tf-sticky-buy { position: fixed; bottom: 0; left: 0; right: 0; z-index: 1010; display: flex; align-items: center; gap: 16px; padding: 12px 16px calc(12px + env(safe-area-inset-bottom)); background: #fff; border-top: 1px solid #dedad3; box-shadow: 0 -4px 20px rgba(41,37,31,.06); }
  .tf-sticky-buy-price { flex: 1; font-size: 16px; font-weight: 600; font-variant-numeric: tabular-nums; }
  .tf-sticky-buy button { min-height: 46px; padding: 12px 18px; border: 0; border-radius: 2px; background: #29251f; color: #fff; font: inherit; font-size: 13px; font-weight: 600; cursor: pointer; }
  .tf-sticky-buy button:disabled { opacity: .5; cursor: default; }
  body.tf-buy-visible { padding-bottom: calc(84px + env(safe-area-inset-bottom)); }
  body.tf-buy-visible .btn-whatsapp { bottom: calc(96px + env(safe-area-inset-bottom)); }
  #product_form { scroll-margin-top: 155px; }
}

/* Moda Urbana Oficial: pastel coral, peach and soft gold, with readable terracotta. */
.tf-size-chart { margin: 12px 0 24px; border-top: 1px solid #ebc9b7; border-bottom: 1px solid #ebc9b7; }
.tf-size-chart summary { padding: 16px 0; color: #8e4939; cursor: pointer; font-size: 14px; font-weight: 600; }
.tf-size-chart-scroll { max-width: 100%; overflow-x: auto; margin-bottom: 16px; }
.tf-size-chart table { width: 100%; border-collapse: collapse; font-size: 13px; line-height: 1.5; color: #49352e; font-variant-numeric: tabular-nums; }
.tf-size-chart caption { text-align: left; padding: 0 0 12px; color: #8e4939; }
.tf-size-chart th, .tf-size-chart td { padding: 12px; border: 1px solid #ebc9b7; text-align: center; white-space: nowrap; }
.tf-size-chart th { background: #fbe2d7; color: #8e4939; font-weight: 600; }
.tf-size-chart tbody tr:nth-child(even) { background: #fff3e7; }
.tf-size-chart summary:focus-visible, .tf-size-chart-scroll:focus-visible { outline: 2px solid #8e4939; outline-offset: 3px; }
:root {
  --mu-ivory: #fffaf6;
  --mu-sand: #fbe2d7;
  --mu-gold: #e7c78f;
  --mu-bronze: #8e4939;
  --mu-bronze-hover: #71392d;
  --mu-ink: #49352e;
  --mu-line: #ebc9b7;
}
body[class] { background-color: var(--mu-ivory); color: var(--mu-ink); }
body .tf-header.head-main {
  background: rgba(255,250,246,.96);
  border-bottom-color: var(--mu-line);
  box-shadow: 0 4px 20px rgba(128,85,34,.07);
}
body .tf-shipping-announcement { background: var(--mu-sand); color: var(--mu-bronze); border-bottom: 1px solid var(--mu-line); }
body .tf-header .nav-list-link:hover,
body .tf-header .nav-list-link.selected,
body .tf-header .tf-nav-promotions > .nav-list-link { color: var(--mu-bronze); }
body .tf-header .cart-summary .badge { background: var(--mu-bronze); color: #fff; }
body .tf-header .search-input { border-color: var(--mu-line); }
body .btn-primary,
body .tf-footer .tf-newsletter-submit,
body .tf-contact-layout button[type="submit"],
body .tf-sticky-buy button,
body .category-controls a[data-toggle="#nav-filters"] {
  background: var(--mu-bronze); color: #fff; border-color: var(--mu-bronze);
  transition: background-color .2s ease, border-color .2s ease;
}
body .btn-primary:hover,
body .tf-footer .tf-newsletter-submit:hover,
body .tf-contact-layout button[type="submit"]:hover,
body .tf-sticky-buy button:hover,
body .category-controls a[data-toggle="#nav-filters"]:hover { background: var(--mu-bronze-hover); color: #fff; border-color: var(--mu-bronze-hover); }
body .btn-secondary { color: var(--mu-bronze); border-color: var(--mu-bronze); background: var(--mu-ivory); }
body .btn-secondary:hover { background: var(--mu-sand); color: var(--mu-bronze-hover); }
body .page-header h1,
body .tf-footer-heading,
body .tf-newsletter-intro h2,
body .tf-delivery-title,
body .tf-product-details summary,
body .tf-size-help summary { color: var(--mu-bronze); }
body .item-product .item-price,
body #single-product #price_display,
body .tf-sticky-buy-price { color: var(--mu-bronze); }
body .item-product .label.label-accent { background: var(--mu-sand); color: var(--mu-bronze); border: 1px solid var(--mu-line); }
body .tf-back-to-results,
body .tf-size-help a,
body .tf-testimonial-original { color: var(--mu-bronze); }
body .tf-product-details,
body .tf-size-help { border-color: var(--mu-line); }
body .tf-variant-option[aria-pressed="true"],
body #single-product .btn-variant.selected { outline-color: var(--mu-bronze); border-color: var(--mu-gold); }
body .tf-variant-option[aria-pressed="true"] { background: var(--mu-sand); color: var(--mu-bronze); }
body .tf-variant-status { color: var(--mu-bronze); }
body .tf-sticky-buy { background: var(--mu-ivory); border-top-color: var(--mu-gold); }
body .tf-benefits .service-item { background: var(--mu-ivory); border-color: var(--mu-line); }
body .tf-benefits .service-item svg { color: var(--mu-bronze); fill: currentColor; }
body .tf-testimonials,
body .tf-footer { background: var(--mu-ivory); color: var(--mu-ink); border-color: var(--mu-line); }
body .tf-footer-newsbar,
body .tf-testimonial-mark { background: var(--mu-sand); color: var(--mu-bronze); }
body .tf-testimonial-card { border-color: var(--mu-line); box-shadow: 0 6px 16px rgba(128,85,34,.06); }
body .tf-footer .tf-social-card { --social-highlight: var(--mu-bronze); border-color: var(--mu-line); }
body .tf-footer a:hover { color: var(--mu-bronze); }
body .tf-privacy-check .tf-privacy-input { accent-color: var(--mu-bronze); }
body .btn:focus-visible,
body .tf-header a:focus-visible,
body .tf-footer a:focus-visible { outline: 2px solid var(--mu-bronze); outline-offset: 3px; }

/* PLP purchase controls: keep native quickshop and cart interactions. */
.tf-plp-actions { display: flex; gap: 8px; margin: 14px 0 20px; align-items: stretch; text-align: center; }
.tf-plp-buy, .tf-plp-cart { display: flex; align-items: center; justify-content: center; min-height: 44px; border: 2px solid currentColor; border-radius: 10px; font: inherit; font-weight: 700; text-decoration: none; }
.tf-plp-buy { flex: 1; background: #171717; color: #fff; border-color: #171717; padding: 10px 8px; }
.tf-plp-cart { gap: 6px; width: 52px; height: 100%; padding: 10px; background: transparent; color: #171717; cursor: pointer; }
.tf-plp-cart .icon-inline { width: 19px; height: 19px; fill: currentColor; }
.tf-plp-cart-form { flex: 0 0 52px; margin: 0; }
.tf-plp-cart:disabled { opacity: .4; cursor: default; }
.tf-plp-buy:hover { background: #383838; color: #fff; }
.tf-plp-buy:focus-visible, .tf-plp-cart:focus-visible { outline: 2px solid #966a2f; outline-offset: 3px; }
@media (max-width: 360px) { .tf-plp-actions { gap: 5px; } .tf-plp-cart, .tf-plp-cart-form { width: 44px; flex-basis: 44px; } }

/* Brand surfaces retain contrast while echoing the supplied coral and gold logo. */
body .tf-header .mu-brand-logo { display: block; width: 106px; height: 106px; max-height: none; object-fit: contain; }
body .tf-header #logo { line-height: 0; }
body .tf-footer { background: #fff0e7; }
body .tf-testimonial-card { background: #fffaf6; }
body .tf-testimonial-mark { background: #f6e6c7; }
body .tf-benefits .service-item { background: #fff3e7; }
body .tf-plp-buy { background: var(--mu-bronze); border-color: var(--mu-bronze); }
body .tf-plp-buy:hover { background: var(--mu-bronze-hover); }
body .tf-plp-cart { color: var(--mu-bronze); }
body .tf-plp-buy:focus-visible, body .tf-plp-cart:focus-visible { outline-color: var(--mu-bronze); }
@media (max-width: 767px) {
  body .tf-header .mu-brand-logo { width: 76px; height: 76px; }
}

/* Reference header: wide search between the brand and service shortcuts. */
body .mu-reference-header.head-main { background: var(--mu-ivory); box-shadow: none; }
body .mu-reference-header > .container-fluid { max-width: 1920px; padding-inline: 32px; }
body .mu-reference-header .tf-shipping-announcement { padding: 11px 16px; font-size: 13px; letter-spacing: 0; text-transform: none; }
body .mu-reference-header .mu-brand-row { display: grid; grid-template-columns: 112px minmax(180px, 1fr) auto; align-items: center; gap: 24px; padding-block: 14px; }
body .mu-reference-header .js-logo-col { width: auto; max-width: none; padding: 0; }
body .mu-reference-header .mu-brand-logo { width: 96px; height: 96px; margin: 0; padding: 0; }
body .mu-reference-header .mu-header-search { min-width: 0; position: relative; }
body .mu-reference-header .mu-header-search .js-search-form { display: block; width: 100%; margin: 0; }
body .mu-reference-header .mu-header-search .form-group { margin: 0 !important; }
body .mu-reference-header .mu-header-search .search-input { width: 100%; height: 54px; padding: 0 18px 0 50px; border: 1px solid transparent; border-radius: 16px; background: #fff; color: var(--mu-ink); font-size: 15px; }
body .mu-reference-header .mu-header-search .search-input::placeholder { color: #79675f; }
body .mu-reference-header .mu-header-search .search-input:focus { outline: 2px solid var(--mu-bronze); outline-offset: 2px; }
body .mu-reference-header .mu-header-search .search-input-submit { left: 6px; right: auto; top: 0; width: 44px; height: 54px; color: var(--mu-bronze); }
body .mu-reference-header .mu-header-search .search-suggest { left: 0; right: 0; width: 100%; z-index: 1100; margin: 8px 0 0; border-radius: 12px; }
body .mu-reference-header .tf-header-actions { gap: 18px; width: auto; max-width: none; }
body .mu-reference-header .mu-service-link { display: inline-flex; align-items: center; gap: 8px; min-height: 44px; color: var(--mu-ink); font-size: 14px; white-space: nowrap; }
body .mu-reference-header .mu-service-link .icon-inline { width: 22px; height: 22px; flex-shrink: 0; }
body .mu-reference-header .mu-returns-link svg { fill: none; }
body .mu-reference-header .mu-account-link { display: inline-flex; align-items: center; justify-content: center; min-width: 44px; min-height: 44px; color: var(--mu-bronze); }
body .mu-reference-header .cart-summary > a { color: var(--mu-bronze); }
body .mu-reference-header .utilities-container { margin: 0; }
body .mu-reference-header .nav-desktop { border: 0; }
body .mu-reference-header .nav-desktop-list { justify-content: space-between; gap: 10px; padding: 0 0 12px; }
body .mu-reference-header .nav-desktop-list > .nav-item > .nav-list-link { font-size: 15px; letter-spacing: 0; text-transform: none; padding: 12px 16px; min-height: 48px; }
body .mu-reference-header .tf-nav-promotions > .nav-list-link { border-radius: 10px; background: var(--mu-bronze); color: #fff; }
body .mu-reference-header .tf-nav-promotions > .nav-list-link:hover { background: var(--mu-bronze-hover); color: #fff; }
@media (min-width: 768px) and (max-width: 1199px) {
  body .mu-reference-header > .container-fluid { padding-inline: 20px; }
  body .mu-reference-header .mu-brand-row { gap: 16px; grid-template-columns: 90px minmax(180px, 1fr) auto; }
  body .mu-reference-header .mu-brand-logo { width: 82px; height: 82px; }
  body .mu-reference-header .mu-service-link span { display: none; }
  body .mu-reference-header .mu-service-link { justify-content: center; min-width: 36px; }
  body .mu-reference-header .tf-header-actions { gap: 8px; }
  body .mu-reference-header .nav-desktop-list > .nav-item > .nav-list-link { padding-inline: 10px; font-size: 13px; }
}
@media (max-width: 767px) {
  body .mu-reference-header > .container-fluid { padding-inline: 16px; }
  body .mu-reference-header .tf-shipping-announcement { padding: 8px 12px; font-size: 11px; }
  body .mu-reference-header .mu-brand-row { grid-template-columns: minmax(0, 1fr) auto minmax(0, 1fr); gap: 8px; padding: 6px 0 12px; }
  body .mu-reference-header .mu-mobile-menu { grid-column: 1; grid-row: 1; }
  body .mu-reference-header .js-logo-col { grid-column: 2; grid-row: 1; }
  body .mu-reference-header .mu-brand-logo { width: 72px; height: 72px; }
  body .mu-reference-header .tf-header-actions { grid-column: 3; grid-row: 1; gap: 0; }
  body .mu-reference-header .mu-service-link { display: none; }
  body .mu-reference-header .mu-account-link { min-width: 36px; }
  body .mu-reference-header .mu-header-search { grid-column: 1 / -1; grid-row: 2; }
  body .mu-reference-header .mu-header-search .search-input { height: 46px; border-radius: 12px; font-size: 14px; }
  body .mu-reference-header .mu-header-search .search-input-submit { height: 46px; }
  body .mu-reference-header .tf-mobile-category-nav { border: 0; }
  body .mu-reference-header .tf-mobile-categories { gap: 24px; }
  body .mu-reference-header .tf-mobile-categories .nav-list-link { font-size: 12px; text-transform: none; letter-spacing: 0; }
}

/* The supplied wide photograph is exclusive to the Moda Feminina category. */
body .mu-womens-banner { width: 100%; max-width: 100%; height: auto; aspect-ratio: 1142 / 364; margin-right: 0 !important; background: #454441; }
body .mu-womens-banner .category-banner-image { display: block; height: 100%; object-fit: cover; object-position: center; }
body .mu-womens-banner .category-banner-info { color: #fff; text-shadow: 0 1px 5px rgba(0,0,0,.8); }
body .mu-womens-banner .category-banner-info h1,
body .mu-womens-banner .category-banner-info a { color: inherit; }
@media (max-width: 767px) {
  body .mu-womens-banner { min-height: 185px; }
}
