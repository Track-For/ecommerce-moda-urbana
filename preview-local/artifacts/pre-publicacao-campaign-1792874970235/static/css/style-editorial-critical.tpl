{# TRACK FOR — Editorial geometry: header, hero and primary showcase only.
   Colors, image proportions, content and section order remain panel-owned. #}
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
.tf-header .logo-img { max-height: 44px; margin: 8px 0; }
.tf-header .logo-text { font-size: clamp(17px, 1.6vw, 23px); margin: 0; }
.tf-header .nav-desktop-list { padding-top: 0; padding-bottom: 0; }
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
.tf-editorial-module { padding: 32px 0 48px; }
.tf-editorial-module > .container-fluid { max-width: 1600px; padding: 0 24px; }
.tf-edit-heading { margin: 0 0 24px; font-size: clamp(22px, 2.2vw, 34px); line-height: 1.2; }
.tf-edit-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 24px 12px; }
.tf-edit-card { min-width: 0; position: relative; }
.tf-edit-link { display: block; height: 100%; color: inherit; }
.tf-edit-media { position: relative; aspect-ratio: 4 / 5; overflow: hidden; background: rgba(127,127,127,.06); }
.tf-edit-image { display: block; position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; object-position: center top; }
.tf-edit-caption { padding-top: 12px; }
.tf-edit-title { margin: 0; font-family: var(--body-font); font-size: 15px; font-weight: 400; line-height: 1.4; }
.tf-edit-arrow { display: inline-block; padding-left: 10px; opacity: .5; }
.tf-edit-description { margin: 8px 0 0; font-size: 13px; line-height: 1.5; }
.tf-edit-cta { display: inline-block; margin-top: 10px; font-size: 12px; text-decoration: underline; text-underline-offset: 4px; }
.tf-edit-lead { grid-column: 1 / -1; }
.tf-edit-lead .tf-edit-media { aspect-ratio: 4 / 5; }
.tf-edit-lead .tf-edit-caption { position: absolute; inset: auto 0 0; padding: 64px 24px 24px; color: #fff; background: linear-gradient(transparent, rgba(0,0,0,.65)); }
.tf-edit-lead .tf-edit-title { font-family: var(--heading-font); font-size: clamp(28px, 3vw, 42px); line-height: 1.15; }
@media (min-width: 768px) {
  .tf-editorial-module { padding: 40px 0 64px; }
  .tf-editorial-module > .container-fluid { padding: 0 40px; }
  .tf-edit-grid { grid-template-columns: minmax(0, 1.25fr) minmax(0, 1fr); gap: 24px 16px; }
  .tf-edit-count-medium { grid-template-columns: minmax(0, 1.8fr) repeat(2, minmax(0, 1fr)); }
  .tf-edit-count-large { grid-template-columns: minmax(0, 2.4fr) repeat(3, minmax(0, 1fr)); }
  .tf-edit-lead { grid-column: 1; grid-row: span 2; min-height: 480px; }
  .tf-edit-lead .tf-edit-media { height: 100%; min-height: 480px; aspect-ratio: auto; }
  .tf-edit-count-small .tf-edit-media { aspect-ratio: 16 / 9; }
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
.tf-occasion { max-width: 1600px; padding: 32px 24px; }
.tf-occasion h2 {
  font-family: Georgia, 'Times New Roman', serif;
  font-size: clamp(48px, 7.5vw, 112px);
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
.tf-editorial-pair { display: grid; grid-template-columns: minmax(0, 1fr) minmax(0, 1fr); max-width: 1600px; margin: 16px auto 64px; }
.tf-pair-campaign { position: relative; min-width: 0; aspect-ratio: 4 / 5; overflow: hidden; }
.tf-pair-campaign-link { display: block; height: 100%; }
.tf-pair-image { display: block; width: 100%; height: 100%; object-fit: cover; object-position: center top; }
.tf-pair-caption { position: absolute; inset: auto 0 0; padding: 96px 32px 40px; color: #fff; background: linear-gradient(transparent, rgba(0,0,0,.55)); font-family: var(--heading-font); font-size: clamp(28px, 3.3vw, 48px); line-height: 1.1; text-align: center; pointer-events: none; }
.tf-pair-products { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); align-content: center; gap: 16px; padding: 32px; min-width: 0; }
.tf-pair-products > .item-product { width: 100%; max-width: none; padding: 0; margin: 0; }
.tf-pair-products .item { margin: 0; padding: 0; }
.tf-pair-products .item-image { aspect-ratio: 2 / 3; background: rgba(127,127,127,.06); border-radius: 0; }
.tf-pair-products .js-item-image-padding { height: 100%; padding-bottom: 0 !important; }
.tf-pair-products .item-image > a { height: 100%; }
.tf-pair-products .item-image img { width: 100%; height: 100% !important; object-fit: contain; }
.tf-pair-products .item-description { padding: 16px 0; text-align: center; }
.tf-pair-products .item-name { font-size: 14px; line-height: 1.5; }
.tf-pair-products .item-price { font-size: 15px; }
.tf-editorial-pair a:focus-visible { outline: 2px solid currentColor; outline-offset: -3px; }
@media (max-width: 767px) {
  .tf-editorial-pair { grid-template-columns: minmax(0, 1fr); margin-bottom: 32px; }
  .tf-pair-products { padding: 24px 16px; gap: 12px; }
}
.tf-occasion .item { margin-top: 0 !important; padding-top: 0 !important; }
.tf-occasion .item-image { aspect-ratio: 2 / 3; background: rgba(127,127,127,.06); border-radius: 0; }
.tf-occasion .js-item-image-padding { height: 100%; padding-bottom: 0 !important; }
.tf-occasion .item-image > a { height: 100%; }
.tf-occasion .item-image img { width: 100%; height: 100% !important; object-fit: contain; }
.tf-occasion .item-description { padding: 16px 2px 24px; text-align: left; }
.tf-occasion .item-name { min-height: 0; font-size: 14px; font-weight: 400; line-height: 1.5; }
.tf-occasion .item-price { font-size: 15px; font-weight: 600; }
.tf-occasion .item-installments { font-size: 12px; }
.tf-occasion .swiper-button-prev,
.tf-occasion .swiper-button-next { border-radius: 50%; border-color: rgba(127,127,127,.2); }
@media (min-width: 768px) {
  .tf-featured.tf-occasion { padding: 48px 40px; }
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
