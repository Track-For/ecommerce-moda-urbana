/* Shopping refinements: native product, shipping and filter integrations. */
.tf-product-details, .tf-size-help { border-top: 1px solid #CDAF99; padding: 18px 0; }
.tf-product-details summary, .tf-size-help summary { cursor: pointer; font-size: 15px; font-weight: 600; line-height: 1.5; }
.tf-product-details .user-content, .tf-size-help p { font-size: 14px; line-height: 1.75; margin: 16px 0 0; max-width: 65ch; overflow-wrap: anywhere; }
.tf-product-details img { max-width: 100%; height: auto; }
.tf-size-help a, .tf-back-to-results { display: inline-block; padding: 12px 0; text-decoration: underline; text-underline-offset: 4px; font-size: 13px; }
.tf-delivery-title { font-size: 16px; font-weight: 600; margin: 0 0 10px; }
.tf-delivery-note { font-size: 13px; line-height: 1.65; margin: 0 0 16px; }
#single-product .page-header h1 { font-size: clamp(25px, 2.6vw, 36px); line-height: 1.2; text-wrap: balance; }
#single-product .price-container { font-variant-numeric: tabular-nums; }
#single-product .js-product-variants-group { margin-bottom: 18px; }
#single-product .btn-variant, .tf-variant-option { min-width: 44px; min-height: 44px; border: 1px solid #CDAF99; border-radius: 2px; cursor: pointer; }
.tf-variant-options { display: flex; flex-wrap: wrap; gap: 8px; margin: 10px 0; }
.tf-native-variant-select { position: absolute !important; width: 1px !important; height: 1px !important; padding: 0 !important; clip-path: inset(50%); overflow: hidden; }
.tf-variant-option { padding: 10px 14px; background: #FFFFFF; color: #752416; font: inherit; font-size: 14px; }
.tf-variant-option[aria-pressed="true"], #single-product .btn-variant.selected { outline: 2px solid #752416; outline-offset: 2px; }
.tf-variant-option[data-unavailable="true"], #single-product .btn-variant-no-stock { opacity: .45; text-decoration: line-through; }
.tf-variant-status { min-height: 20px; font-size: 13px; line-height: 1.5; margin: 0 0 12px; }
.tf-product-details summary:focus-visible, .tf-size-help summary:focus-visible, .tf-variant-option:focus-visible, #single-product .btn-variant:focus-visible, .tf-sticky-buy button:focus-visible { outline: 2px solid #9B1B00; outline-offset: 4px; }
.item-product .item-image .js-item-image-padding { height: 0; padding-bottom: 133.333333% !important; }
.item-product .item-image { aspect-ratio: 3 / 4; background: #FFFFFF; }
.item-product .item-image img { width: 100%; height: 100% !important; max-height: none; object-fit: contain; object-position: center; }
.item-product .item-name { font-size: 14px; line-height: 1.5; font-weight: 500; text-transform: none; letter-spacing: normal; }
#single-product .js-product-slide-link { padding-bottom: 133.333333% !important; background: #FFFFFF; }
#single-product .product-slider-image { width: 100%; height: 100%; max-height: none; object-fit: contain; }
.category-controls a[data-toggle="#nav-filters"], .category-controls a[data-toggle="#sort-by"] { min-height: 44px; padding: 13px 18px; border: 1px solid #CDAF99; text-decoration: none; }
.category-controls a[data-toggle="#nav-filters"] { background: #752416; color: #FBE4CD; }
.filter-chips-container .chip { min-height: 36px; }
.tf-sticky-buy[hidden] { display: none !important; }
.tf-sticky-buy { display: none; }
@media (max-width: 767px) {
  .tf-sticky-buy { position: fixed; bottom: 0; left: 0; right: 0; z-index: 1010; display: flex; align-items: center; gap: 16px; padding: 12px 16px calc(12px + env(safe-area-inset-bottom)); background: #FFFFFF; border-top: 1px solid #CDAF99; box-shadow: 0 -4px 20px rgba(117, 36, 22,.06); }
  .tf-sticky-buy-price { flex: 1; font-size: 16px; font-weight: 600; font-variant-numeric: tabular-nums; }
  .tf-sticky-buy button { min-height: 46px; padding: 12px 18px; border: 0; border-radius: 2px; background: #752416; color: #FBE4CD; font: inherit; font-size: 13px; font-weight: 600; cursor: pointer; }
  .tf-sticky-buy button:disabled { opacity: .5; cursor: default; }
  body.tf-buy-visible { padding-bottom: calc(84px + env(safe-area-inset-bottom)); }
  body.tf-buy-visible .btn-whatsapp { bottom: calc(96px + env(safe-area-inset-bottom)); }
  #product_form { scroll-margin-top: 155px; }
}

/* Moda Urbana Oficial: pastel coral, peach and soft gold, with readable terracotta. */
.tf-size-chart { margin: 12px 0 24px; border-top: 1px solid #CDAF99; border-bottom: 1px solid #CDAF99; }
.tf-size-chart summary { padding: 16px 0; color: #9B1B00; cursor: pointer; font-size: 14px; font-weight: 600; }
.tf-size-chart-scroll { max-width: 100%; overflow-x: auto; margin-bottom: 16px; }
.tf-size-chart table { width: 100%; border-collapse: collapse; font-size: 13px; line-height: 1.5; color: #752416; font-variant-numeric: tabular-nums; }
.tf-size-chart caption { text-align: left; padding: 0 0 12px; color: #9B1B00; }
.tf-size-chart th, .tf-size-chart td { padding: 12px; border: 1px solid #CDAF99; text-align: center; white-space: nowrap; }
.tf-size-chart th { background: #FFFFFF; color: #9B1B00; font-weight: 600; }
.tf-size-chart tbody tr:nth-child(even) { background: #FFFFFF; }
.tf-size-chart summary:focus-visible, .tf-size-chart-scroll:focus-visible { outline: 2px solid #9B1B00; outline-offset: 3px; }
:root {
  --mu-ivory: #FFFFFF;
  --mu-sand: #FFFFFF;
  --mu-gold: #B58B71;
  --mu-bronze: #9B1B00;
  --mu-bronze-hover: #752416;
  --mu-ink: #752416;
  --mu-line: #CDAF99;
}
body[class] { background-color: var(--mu-ivory); color: var(--mu-ink); }
body .tf-header.head-main {
  background: rgba(255, 255, 255,.96);
  border-bottom-color: var(--mu-line);
  box-shadow: 0 4px 20px rgba(117, 36, 22,.07);
}
body .tf-shipping-announcement { background: var(--mu-sand); color: var(--mu-bronze); border-bottom: 1px solid var(--mu-line); }
body .tf-header .nav-list-link:hover,
body .tf-header .nav-list-link.selected,
body .tf-header .tf-nav-promotions > .nav-list-link { color: var(--mu-bronze); }
body .tf-header .cart-summary .badge { background: var(--mu-bronze); color: #FBE4CD; }
body .tf-header .search-input { border-color: var(--mu-line); }
body .btn-primary,
body .tf-footer .tf-newsletter-submit,
body .tf-contact-layout button[type="submit"],
body .tf-sticky-buy button,
body .category-controls a[data-toggle="#nav-filters"] {
  background: var(--mu-bronze); color: #FBE4CD; border-color: var(--mu-bronze);
  transition: background-color .2s ease, border-color .2s ease;
}
body .btn-primary:hover,
body .tf-footer .tf-newsletter-submit:hover,
body .tf-contact-layout button[type="submit"]:hover,
body .tf-sticky-buy button:hover,
body .category-controls a[data-toggle="#nav-filters"]:hover { background: var(--mu-bronze-hover); color: #FBE4CD; border-color: var(--mu-bronze-hover); }
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
body .tf-testimonial-card { border-color: var(--mu-line); box-shadow: 0 6px 16px rgba(117, 36, 22,.06); }
body .tf-footer .tf-social-card { --social-highlight: var(--mu-bronze); border-color: var(--mu-line); }
body .tf-footer a:hover { color: var(--mu-bronze); }
body .tf-privacy-check .tf-privacy-input { accent-color: var(--mu-bronze); }
body .btn:focus-visible,
body .tf-header a:focus-visible,
body .tf-footer a:focus-visible { outline: 2px solid var(--mu-bronze); outline-offset: 3px; }

/* PLP purchase controls: keep native quickshop and cart interactions. */
.tf-plp-actions { display: flex; gap: 8px; margin: 14px 0 20px; align-items: stretch; text-align: center; }
.tf-plp-buy, .tf-plp-cart { display: flex; align-items: center; justify-content: center; min-height: 44px; border: 2px solid currentColor; border-radius: 10px; font: inherit; font-weight: 700; text-decoration: none; }
.tf-plp-buy { flex: 1; background: #752416; color: #FBE4CD; border-color: #752416; padding: 10px 8px; }
.tf-plp-cart { gap: 6px; width: 52px; height: 100%; padding: 10px; background: transparent; color: #752416; cursor: pointer; }
.tf-plp-cart .icon-inline { width: 19px; height: 19px; fill: currentColor; }
.tf-plp-cart-form { flex: 0 0 52px; margin: 0; }
.tf-plp-cart:disabled { opacity: .4; cursor: default; }
.tf-plp-buy:hover { background: #752416; color: #FBE4CD; }
.tf-plp-buy:focus-visible, .tf-plp-cart:focus-visible { outline: 2px solid #9B1B00; outline-offset: 3px; }
@media (max-width: 360px) { .tf-plp-actions { gap: 5px; } .tf-plp-cart, .tf-plp-cart-form { width: 44px; flex-basis: 44px; } }

/* Brand surfaces retain contrast while echoing the supplied coral and gold logo. */
body .tf-header .mu-brand-logo { display: block; width: 106px; height: 106px; max-height: none; object-fit: contain; }
body .tf-header #logo { line-height: 0; }
body .tf-footer { background: #FFFFFF; }
body .tf-testimonial-card { background: #FFFFFF; }
body .tf-testimonial-mark { background: #F6CBC2; }
body .tf-benefits .service-item { background: #FFFFFF; }
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
body .mu-reference-header .mu-header-search .search-input { width: 100%; height: 54px; padding: 0 18px 0 50px; border: 1px solid transparent; border-radius: 16px; background: #FFFFFF; color: var(--mu-ink); font-size: 15px; }
body .mu-reference-header .mu-header-search .search-input::placeholder { color: #752416; }
body .mu-reference-header .mu-header-search .search-input:focus { outline: 2px solid var(--mu-bronze); outline-offset: 2px; }
body .mu-reference-header .mu-header-search .search-input-submit { left: 6px; right: auto; top: 0; width: 44px; height: 54px; color: var(--mu-bronze); }
body .mu-reference-header .mu-header-search .search-suggest { left: 0; right: 0; width: 100%; z-index: 1100; margin: 8px 0 0; border-radius: 12px; }
body .mu-reference-header .tf-header-actions { gap: 18px; width: auto; max-width: none; }
body .mu-reference-header .mu-service-link { display: inline-flex; align-items: center; gap: 8px; min-height: 44px; color: var(--mu-ink); font-size: 14px; white-space: nowrap; }
body .mu-reference-header .mu-service-link .icon-inline { width: 22px; height: 22px; flex-shrink: 0; }
body .mu-reference-header .mu-returns-link svg { fill: none; }
body .mu-reference-header .mu-account-link { display: inline-flex; align-items: center; justify-content: center; min-width: 44px; min-height: 44px; color: var(--mu-bronze); }
body .mu-reference-header .mu-account-menu { position: relative; flex-shrink: 0; }
body .mu-reference-header .mu-account-link { cursor: pointer; list-style: none; }
body .mu-reference-header .mu-account-link::-webkit-details-marker { display: none; }
body .mu-reference-header .mu-account-link::marker { content: ''; }
body .mu-reference-header .mu-account-link svg { width: 26px; height: 26px; fill: none; }
body .mu-reference-header .mu-account-link:focus-visible { outline: 2px solid var(--mu-bronze); outline-offset: 3px; border-radius: 4px; }
body .mu-reference-header .mu-account-menu-content { position: absolute; top: calc(100% + 8px); right: 0; z-index: 1100; width: 200px; max-width: calc(100vw - 32px); padding: 8px; border: 1px solid var(--mu-line); border-radius: 12px; background: var(--mu-ivory); color: var(--mu-ink); box-shadow: 0 12px 36px rgba(117, 36, 22,.16); text-align: left; }
body .mu-reference-header .mu-account-menu-content a { display: block; padding: 12px; font-size: 14px; line-height: 1.4; border-radius: 6px; }
body .mu-reference-header .mu-account-menu-content a:hover { background: var(--mu-sand); color: var(--mu-bronze); }
body .mu-reference-header .cart-summary > a { color: var(--mu-bronze); }
body .mu-reference-header .utilities-container { margin: 0; }
body .mu-reference-header .nav-desktop { border: 0; }
body .mu-reference-header .nav-desktop-list { justify-content: space-between; gap: 10px; padding: 0 0 12px; }
body .mu-reference-header .nav-desktop-list > .nav-item > .nav-list-link { font-size: 15px; letter-spacing: 0; text-transform: none; padding: 12px 16px; min-height: 48px; }
body .mu-reference-header .tf-nav-promotions > .nav-list-link { border-radius: 10px; background: var(--mu-bronze); color: #FBE4CD; }
body .mu-reference-header .tf-nav-promotions > .nav-list-link:hover { background: var(--mu-bronze-hover); color: #FBE4CD; }
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

/* Guest buyers follow the private order link received by email. */
.mu-order-help { position: relative; flex-shrink: 0; }
body .mu-reference-header .mu-order-help > summary { cursor: pointer; list-style: none; }
.mu-order-help > summary::-webkit-details-marker { display: none; }
.mu-order-help > summary::marker { content: ''; }
.mu-order-help > summary:focus-visible { outline: 2px solid var(--mu-bronze); outline-offset: 4px; border-radius: 4px; }
.mu-order-help[open] > summary { color: var(--mu-bronze); }
.mu-order-help-content { position: absolute; top: calc(100% + 12px); right: 0; z-index: 1100; width: min(360px, calc(100vw - 32px)); padding: 24px; border: 1px solid var(--mu-line); border-radius: 14px; background: var(--mu-ivory); color: var(--mu-ink); box-shadow: 0 12px 36px rgba(117, 36, 22,.16); text-align: left; white-space: normal; }
.mu-order-help-content h2 { margin: 0 0 12px; font: 600 18px/1.4 var(--body-font); color: var(--mu-bronze); }
.mu-order-help-content p { margin: 0 0 14px; font-size: 14px; line-height: 1.6; }
.mu-order-support { display: inline-block; padding-block: 8px; font-size: 14px; font-weight: 600; text-decoration: underline; text-underline-offset: 3px; }
@media (max-width: 767px) {
  body .mu-reference-header .mu-order-help > summary { display: inline-flex; justify-content: center; min-width: 36px; }
  body .mu-reference-header .mu-order-help > summary span { display: none; }
  .mu-order-help-content { position: fixed; top: auto; right: 16px; left: 16px; width: auto; margin-top: 12px; max-height: 65vh; overflow-y: auto; padding: 20px; }
}

/* The supplied wide photograph is exclusive to the Moda Feminina category. */
body .mu-womens-banner { width: 100%; max-width: 100%; height: auto; aspect-ratio: 1142 / 364; margin-right: 0 !important; background: #752416; }
body .mu-womens-banner .category-banner-image { display: block; height: 100%; object-fit: cover; object-position: center; }
body .mu-womens-banner .category-banner-info { color: #FBE4CD; text-shadow: 0 1px 5px rgba(117, 36, 22,.8); }
body .mu-womens-banner .category-banner-info h1,
body .mu-womens-banner .category-banner-info a { color: inherit; }
@media (max-width: 767px) {
  body .mu-womens-banner { min-height: 185px; }
}

/* Moda Urbana Oficial: supplied November 2026 identity. */
:root { --mu-burnt-red: #9B1B00; --mu-reddish-brown: #752416; --mu-caramel: #B58B71; --mu-rose-beige: #CDAF99; --mu-light-pink: #F6CBC2; --mu-light-peach: #FFFFFF; }
body .mu-reference-header .mu-brand-row { grid-template-columns: 180px minmax(180px,1fr) auto; }
body .mu-reference-header .mu-brand-logo { width: 176px; height: 108px; padding: 8px; box-sizing: border-box; background: #9B1B00; border-radius: 6px; object-fit: contain; }
body .tf-header .nav-list-link, body .tf-header .utilities-item, body .tf-header .cart-summary > a { color: #752416; }
body .tf-header .nav-list-link:hover { color: #9B1B00; }
body .tf-support-navigation a, body .tf-support-page, body .tf-contact-layout { color: #752416; }
body .tf-support-navigation a[aria-current], body .tf-support-page .user-content, body .tf-contact-form-panel { border-color: #B58B71; }
body .tf-support-page .user-content a, body .tf-contact-layout .contact-info a { color: #9B1B00; }
body .tf-contact-layout .form-control { background: #FFFFFF; border-color: #CDAF99; color: #752416; }
body .tf-contact-layout .form-control:focus { border-color: #9B1B00; outline-color: #9B1B00; }
body .mu-shopping-banner strong { color: #9B1B00; }
body .mu-collection-heading a[aria-current] { background: #9B1B00; border-color: #9B1B00; color: #FBE4CD; }
@media(min-width:768px) and (max-width:1199px) { body .mu-reference-header .mu-brand-row { grid-template-columns: 150px minmax(180px,1fr) auto; } body .mu-reference-header .mu-brand-logo { width: 146px; height: 90px; } }
@media(max-width:767px) { body .mu-reference-header .mu-brand-row { grid-template-columns: minmax(0,1fr) auto minmax(0,1fr); } body .mu-reference-header .mu-brand-logo { width: 128px; height: 80px; padding: 6px; } }

/* Highlight shipping and keep the search field distinct from the peach header. */
body .mu-reference-header .tf-shipping-announcement {
  background: #9B1B00;
  color: #FFFFFF;
  border-bottom: 1px solid #752416;
  font-weight: 700;
}
body .mu-reference-header .mu-header-search .search-input {
  background: #FFFFFF;
  border: 1px solid #B58B71;
  color: #752416;
  box-shadow: 0 2px 6px rgba(117,36,22,.06);
}
body .mu-reference-header .mu-header-search .search-input:focus {
  border-color: #9B1B00;
  outline: 2px solid #9B1B00;
  outline-offset: 2px;
}

/* Shopping shortcuts share the category row, keeping the hero directly below the header. */
body .mu-reference-header .mu-nav-collection,
body .mu-reference-header .mu-nav-shipping { padding: 0 4px; }
body .mu-reference-header .mu-nav-collection > .nav-list-link,
body .mu-reference-header .mu-nav-shipping > .nav-list-link {
 display: inline-flex; align-items: center; justify-content: center; gap: 8px;
 min-height: 38px; padding: 8px 16px; border-radius: 9px; font-size: 14px;
 font-weight: 700; line-height: 1.25; white-space: nowrap; text-decoration: none;
}
body .mu-reference-header .mu-nav-collection > .nav-list-link { background: #F6CBC2; color: #752416; }
body .mu-reference-header .mu-nav-collection > .nav-list-link:hover { background: #CDAF99; }
body .mu-reference-header .mu-nav-shipping > .nav-list-link { background: #9B1B00; color: #FFFFFF; }
body .mu-reference-header .mu-nav-shipping > .nav-list-link:hover { background: #752416; color: #FFFFFF; }
.mu-nav-shipping-icon { width: 20px; height: 20px; flex: 0 0 20px; fill: currentColor; }
@media (max-width: 767px) {
 body .mu-reference-header .tf-mobile-categories { gap: 10px; padding-block: 6px; }
 body .mu-reference-header .tf-mobile-categories .mu-nav-collection,
 body .mu-reference-header .tf-mobile-categories .mu-nav-shipping { padding: 0; }
 body .mu-reference-header .tf-mobile-categories .mu-nav-collection > .nav-list-link,
 body .mu-reference-header .tf-mobile-categories .mu-nav-shipping > .nav-list-link { font-size: 12px; min-height: 36px; padding: 8px 12px; }
}

/* Compact, plain category labels requested for all shopping shortcuts. */
body .mu-reference-header .nav-desktop-list { justify-content: center; gap: 30px; }
body .mu-reference-header .mu-nav-collection,
body .mu-reference-header .mu-nav-shipping { padding: 0; }
body .mu-reference-header .mu-nav-collection > .nav-list-link,
body .mu-reference-header .mu-nav-shipping > .nav-list-link,
body .mu-reference-header .mu-nav-collection > .nav-list-link:hover,
body .mu-reference-header .mu-nav-shipping > .nav-list-link:hover {
 background: transparent; border: 0; border-radius: 0; color: #752416;
 padding: 6px 10px; min-height: 34px; font-size: 14px; font-weight: 400;
}
body .mu-reference-header .nav-desktop-list > .nav-item > .nav-list-link {
 padding: 6px 10px; min-height: 34px; font-size: 14px; font-weight: 400;
}
body .mu-reference-header .mu-nav-shipping-icon { display: none; }
body .mu-reference-header .mu-nav-collection > .nav-list-link:hover,
body .mu-reference-header .mu-nav-shipping > .nav-list-link:hover { color: #9B1B00; text-decoration: underline; text-underline-offset: 4px; }
@media (max-width:767px) {
 body .mu-reference-header .tf-mobile-categories { gap: 16px; padding-block: 2px; }
 body .mu-reference-header .tf-mobile-categories .mu-nav-collection > .nav-list-link,
 body .mu-reference-header .tf-mobile-categories .mu-nav-shipping > .nav-list-link {
  background: transparent; color: #752416; padding: 5px 0; min-height: 30px; font-size: 12px; font-weight: 400;
 }
}
