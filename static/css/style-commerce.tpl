.mu-shopping-banners{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:18px;max-width:1440px;margin:28px auto;padding:0 24px}.mu-shopping-banner{display:flex;flex-direction:column;align-items:flex-start;padding:32px;color:#752416;background:#FFFFFF;text-decoration:none;border:1px solid #CDAF99;border-radius:4px}.mu-shopping-banner-new{background:#FFFFFF;border-color:#CDAF99}.mu-shopping-banner-shipping{background:#F6CBC2;border-color:#CDAF99}.mu-shopping-banner>span{font-size:12px;letter-spacing:.08em;text-transform:uppercase}.mu-shopping-banner h2{font-size:28px;margin:14px 0 10px;line-height:1.2}.mu-shopping-banner p{line-height:1.6;margin:0 0 24px}.mu-shopping-banner strong{margin-top:auto;font-size:14px;text-decoration:underline;text-underline-offset:5px}.mu-shopping-banner:hover{box-shadow:0 4px 16px #75241615}.mu-shopping-banner:focus-visible,.mu-collection-heading a:focus-visible{outline:2px solid #752416;outline-offset:4px}.mu-commerce-trust{clear:both;display:grid;gap:16px;margin:16px 0;padding:20px;border:1px solid #CDAF99;border-radius:6px;background:#FFFFFF;color:#752416;text-align:left;font-size:13px;line-height:1.5}.mu-trust-message{display:flex;align-items:center;gap:12px}.mu-trust-icon{flex-shrink:0;width:28px;height:28px;fill:currentColor}.mu-trust-message strong,.mu-trust-message span,.mu-trust-payments>strong{display:block}.mu-trust-message strong{font-size:15px}.mu-trust-payments .icon-logo{width:48px;height:30px;object-fit:contain;margin:8px 5px 8px 0}.mu-trust-payments small{display:block}.mu-trust-links{display:flex;flex-wrap:wrap;gap:8px 20px}.mu-trust-links a{text-decoration:underline}.tf-footer>.container-fluid>.mu-commerce-trust{grid-template-columns:1fr 1fr;align-items:center}.tf-footer .mu-trust-links{grid-column:1/-1}.mu-collection-heading{padding:32px 24px;background:#FFFFFF;text-align:center}.mu-collection-heading h1{font-size:36px;margin:12px 0}.mu-collection-heading p{margin:8px 0;line-height:1.6}.mu-collection-heading nav{display:flex;flex-wrap:wrap;justify-content:center;gap:12px;margin-top:20px}.mu-collection-heading a{padding:10px 16px;border:1px solid #B58B71;border-radius:3px}.mu-collection-heading a[aria-current]{background:#752416;color:#FBE4CD}.tf-header .mu-nav-collection .nav-list-link{font-weight:700}@media(max-width:767px){.mu-shopping-banners{grid-template-columns:1fr;padding:0 16px;gap:12px;margin:20px auto}.mu-shopping-banner{padding:24px}.mu-shopping-banner h2{font-size:25px}.tf-footer>.container-fluid>.mu-commerce-trust{grid-template-columns:1fr}.mu-collection-heading h1{font-size:30px}}

/* Compact shopping shortcuts, inspired by the supplied navigation reference. */
.mu-shopping-banners { grid-template-columns: 1fr 1fr 1.2fr; gap: 14px; margin: 16px auto; }
.mu-shopping-banner { justify-content: center; gap: 6px; min-height: 98px; padding: 14px 20px; border-radius: 12px; box-sizing: border-box; }
.mu-shopping-banner > span, .mu-shopping-banner p { display: none; }
.mu-shopping-banner h2 { margin: 0; font-family: var(--body-font); font-size: 20px; font-weight: 700; line-height: 1.25; }
.mu-shopping-banner strong { margin-top: 0; font-size: 13px; line-height: 1.4; text-underline-offset: 3px; }
.mu-shopping-banner.mu-shopping-banner-shipping { background: #9B1B00; border-color: #9B1B00; color: #FBE4CD; }
.mu-shopping-banner-shipping h2 { display: flex; align-items: center; gap: 10px; font-size: 21px; }
.mu-shipping-banner-icon { flex: 0 0 26px; width: 26px; height: 26px; fill: currentColor; }
.mu-shopping-banner.mu-shopping-banner-shipping p { display: block; margin: 0; font-size: 12px; line-height: 1.35; }
body .mu-shopping-banner.mu-shopping-banner-shipping strong { color: #FBE4CD; }
.mu-shopping-banner-shipping:hover { background: #752416; border-color: #752416; }
@media (max-width: 767px) {
 .mu-shopping-banners { grid-template-columns: repeat(2,minmax(0,1fr)); gap: 10px; margin: 12px auto; }
 .mu-shopping-banner { min-height: 76px; padding: 12px 14px; gap: 5px; }
 .mu-shopping-banner h2 { font-size: 17px; }
 .mu-shopping-banner strong { font-size: 12px; }
 .mu-shopping-banner-shipping { grid-column: 1 / -1; min-height: 88px; }
 .mu-shopping-banner-shipping h2 { font-size: 20px; }
}

/* White fields across storefront and checkout forms. */
body input:not([type="hidden"]):not([type="submit"]):not([type="button"]):not([type="reset"]):not([type="checkbox"]):not([type="radio"]):not([type="range"]):not([type="color"]):not([type="image"]),
body textarea,
body select,
body .form-select-options,
body .form-quantity {
  background-color: #FFFFFF !important;
  color: #752416 !important;
}
body input::placeholder,
body textarea::placeholder {
  color: #752416 !important;
  opacity: .65;
}
body input:-webkit-autofill,
body input:-webkit-autofill:hover,
body input:-webkit-autofill:focus,
body textarea:-webkit-autofill,
body select:-webkit-autofill {
  -webkit-box-shadow: 0 0 0 1000px #FFFFFF inset !important;
  -webkit-text-fill-color: #752416 !important;
}

/* White page canvas across all storefront templates. */
html, body[class] { background-color: #FFFFFF !important; }
body .tf-footer-newsbar { background-color: #FFFFFF; }

/* A continuous gradient over the full page, beginning at its midpoint. */
body[class] {
  min-height: 100vh;
  background-image: linear-gradient(to bottom, #FFFFFF 0%, #FFFFFF 50%, #FBE4CD 100%) !important;
  background-repeat: no-repeat;
  background-size: 100% 100%;
}
body .mu-about-surface,
body .tf-footer,
body .tf-footer-newsbar,
body .tf-footer .footer-legal,
body .tf-support-page .user-content,
body .tf-contact-layout .tf-contact-form-panel,
body .mu-collection-heading,
body .section-featured-home,
body .section-brands-home,
body .section-testimonials-home,
body .section-newsletter-home,
body .section-welcome-home,
body .section-image-text-home,
body .product-description {
  background-color: transparent !important;
}
