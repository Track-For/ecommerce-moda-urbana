{% if settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
    <section class="tf-instagram section-instafeed-home" data-store="home-instagram-feed">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <a target="_blank" rel="noopener" href="https://www.instagram.com/moda.urbana.oficial/" class="tf-instagram-profile" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                        <span class="tf-instagram-icon" aria-hidden="true">{% include 'snipplets/svg/instagram.tpl' with {svg_custom_class: 'icon-inline icon-lg'} %}</span>
                        <div class="instafeed-title">
                            <h3 class="subtitle font-weight-normal">{{ 'Seguinos en Instagram' | translate }}</h3>
                            <h2 class="h1 mb-0">@moda.urbana.oficial</h2>
                        </div>
                        <span class="tf-instagram-cta js-ig-fallback">{{ 'Ver perfil' | translate }} <span aria-hidden="true">↗</span></span>
                    </a>
                </div>
                <div class="col-12">
                    {% if store.hasInstagramToken() %}
                        <div class="js-ig-success row instafeed-grid pb-3"
                            data-ig-feed
                            data-ig-items-count="8"
                            data-ig-item-class="instafeed-post"
                            data-ig-link-class="instafeed-link"
                            data-ig-image-class="instafeed-img w-100 fade-in"
                            data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
                            style="display: none;">
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </section>
{% endif %}
