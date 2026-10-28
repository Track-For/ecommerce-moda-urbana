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

/* Logo palette: light ivory surfaces, antique gold accents and bronze text. */
:root {
  --mu-ivory: #fffdf9;
  --mu-sand: #f5ecdd;
  --mu-gold: #c99b57;
  --mu-bronze: #805522;
  --mu-bronze-hover: #654019;
  --mu-ink: #27221c;
  --mu-line: #dfc9a7;
}
body[class] { background-color: var(--mu-ivory); color: var(--mu-ink); }
body .tf-header.head-main {
  background: rgba(255,253,249,.96);
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
