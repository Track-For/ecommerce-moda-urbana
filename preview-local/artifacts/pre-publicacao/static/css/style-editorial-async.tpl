{# TRACK FOR — Interaction polish, scoped to the three approved areas. #}
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
