{# TRACK FOR — Interaction polish, scoped to the three approved areas. #}
$tf-glass-background: {{ settings.header_colors ? settings.header_background_color : settings.background_color }};
.tf-header.head-main {
  background: rgba($tf-glass-background, .96);
  border-bottom: 1px solid rgba(127, 127, 127, .18);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, .32), 0 6px 24px rgba(0, 0, 0, .06);
}
@supports ((backdrop-filter: blur(1px)) or (-webkit-backdrop-filter: blur(1px))) {
  .tf-header.head-main {
    background: linear-gradient(120deg, rgba(255, 255, 255, .12), rgba(255, 255, 255, 0) 55%), rgba($tf-glass-background, .78);
    -webkit-backdrop-filter: blur(20px) saturate(135%);
    backdrop-filter: blur(20px) saturate(135%);
  }
}
{% if settings.head_transparent_contrast_options %}
/* Match the native alternate foreground while the header overlays the hero. */
$tf-glass-contrast: #fff;
@if lightness({{ settings.header_transparent_foreground_color }}) > 50% {
  $tf-glass-contrast: #17191c;
}
.tf-header.head-transparent-on-section.head-transparent-contrast:not(:hover) {
  background-color: rgba($tf-glass-contrast, .84);
}
{% endif %}
.tf-home-hero .swiper-text,
.tf-home-hero .swiper-slide-active .swiper-text {
  opacity: 1;
  bottom: auto;
  transition: opacity .25s ease;
}
@media (min-width: 768px) {
  .tf-home-hero .swiper-text-center,
  .tf-home-hero .swiper-slide-active .swiper-text-center { bottom: 8%; }
}
.tf-home-hero .btn,
.tf-home-hero .swiper-button-prev,
.tf-home-hero .swiper-button-next,
.tf-featured .swiper-button-prev,
.tf-featured .swiper-button-next {
  transition: opacity .2s ease, transform .2s ease;
}
.tf-featured .item-image img { transition: transform .35s ease, opacity .25s ease; }
.tf-edit-link:focus-visible { outline: 2px solid currentColor; outline-offset: 4px; }
@media (hover: hover) and (prefers-reduced-motion: no-preference) {
  .tf-edit-image { transition: transform .35s ease; }
  .tf-edit-link:hover .tf-edit-image { transform: scale(1.025); }
  .tf-edit-link:hover .tf-edit-title { text-decoration: underline; text-underline-offset: 4px; }
}
.tf-home-hero a:focus-visible,
.tf-home-hero [tabindex]:focus-visible,
.tf-featured a:focus-visible,
.tf-featured input:focus-visible,
.tf-featured [tabindex]:focus-visible {
  outline: 2px solid currentColor;
  outline-offset: -3px;
}
@media (hover: hover) and (pointer: fine) {
  .tf-home-hero .btn:hover { transform: translateY(-2px); }
  .tf-home-hero .swiper-button-prev:hover,
  .tf-home-hero .swiper-button-next:hover,
  .tf-featured .swiper-button-prev:hover,
  .tf-featured .swiper-button-next:hover { opacity: .65; }
  .tf-featured .item-link:hover .item-name {
    text-decoration: underline;
    text-underline-offset: 4px;
  }
}
@media (prefers-reduced-motion: reduce) {
  /* Keep Swiper wrappers under JS control: its transition lifecycle must finish. */
  .tf-home-hero .swiper-text,
  .tf-home-hero .swiper-text-center,
  .tf-home-hero .btn,
  .tf-home-hero .swiper-button-prev,
  .tf-home-hero .swiper-button-next,
  .tf-featured .swiper-button-prev,
  .tf-featured .swiper-button-next,
  .tf-featured .item-image img {
    animation: none !important;
    transition: none !important;
    scroll-behavior: auto !important;
  }
  .tf-home-hero .btn:hover { transform: none; }
}
