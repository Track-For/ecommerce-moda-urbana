{# One responsive carousel: artwork contains its own text and CTA. #}
{% if not mobile %}
{% set campaigns = [
    {file: 'hero_01_estilo_sem_limites', title: 'Estilo sem limites. Peças que acompanham o seu ritmo. Seu estilo, suas regras.'},
    {file: 'hero_02_vermelho_atitude', title: 'Atitude em cada look. Para marcar presença sem dizer uma palavra.'},
    {file: 'hero_03_leveza_e_estilo', title: 'Leveza que impressiona. Looks leves para momentos marcantes.'},
    {file: 'hero_04_essenciais_urbanos', title: 'O básico nunca foi tão único. Versatilidade para todos os momentos.'},
    {file: 'hero_05_colecao_em_movimento', title: 'Seu estilo em movimento. Descubra novas combinações. Encontre a sua próxima favorita.'}
] %}
<div class="js-home-main-slider-container home-slider-container">
    <div class="tf-home-hero tf-campaign-hero js-home-main-slider-visibility" aria-label="Coleções Moda Urbana Outlet">
        <div class="section-slider">
            <div class="js-home-slider nube-slider-home swiper-container swiper-container-horizontal">
                <div class="swiper-wrapper">
                    {% for campaign in campaigns %}
                    <div class="swiper-slide slide-container">
                        <a class="tf-campaign-link" href="{{ store.products_url }}" aria-label="{{ campaign.title }} Ver coleção">
                            <picture class="tf-campaign-picture">
                                <source media="(max-width: 767px)" srcset="{{ ('images/hero/' ~ campaign.file ~ '_mobile_820x1000.jpg') | static_url }}" width="820" height="1000">
                                <img class="tf-campaign-image" src="{{ ('images/hero/' ~ campaign.file ~ '_desktop_1580x600.jpg') | static_url }}" width="1580" height="600" alt="{{ campaign.title }}" {% if loop.first %}fetchpriority="high" loading="eager"{% else %}loading="lazy"{% endif %}>
                            </picture>
                        </a>
                    </div>
                    {% endfor %}
                </div>
            </div>
        </div>
        <div class="tf-campaign-controls">
            <button type="button" aria-label="Banner anterior" class="js-swiper-home-control js-swiper-home-prev swiper-button-prev d-inline-block svg-icon-text">{% include 'snipplets/svg/chevron-left.tpl' with {svg_custom_class: 'icon-inline icon-xs'} %}</button>
            <div class="js-swiper-home-control js-swiper-home-pagination swiper-pagination-fraction font-small d-inline-block" aria-live="polite"></div>
            <button type="button" aria-label="Próximo banner" class="js-swiper-home-control js-swiper-home-next swiper-button-next d-inline-block svg-icon-text">{% include 'snipplets/svg/chevron-right.tpl' with {svg_custom_class: 'icon-inline icon-xs'} %}</button>
        </div>
    </div>
</div>
{% endif %}
