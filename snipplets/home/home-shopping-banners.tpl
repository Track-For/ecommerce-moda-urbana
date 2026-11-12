<section class="mu-shopping-banners" aria-label="Explore a loja">
    <a class="mu-shopping-banner" href="{{ store.products_url | add_param('sort_by', 'best-selling') }}"><span>Os favoritos da loja</span><h2>Mais vendidos</h2><p>Encontre os produtos mais pedidos.</p><strong>Ver mais vendidos <span aria-hidden="true">→</span></strong></a>
    <a class="mu-shopping-banner mu-shopping-banner-new" href="{{ store.products_url | add_param('sort_by', 'created-descending') }}"><span>Acabaram de chegar</span><h2>Novidades</h2><p>Explore as últimas peças do catálogo.</p><strong>Ver novidades <span aria-hidden="true">→</span></strong></a>
    <a class="mu-shopping-banner mu-shopping-banner-shipping" href="/frete-gratis/"><span>Seu próximo look</span><h2>{% include 'snipplets/svg/truck.tpl' with {svg_custom_class: 'mu-shipping-banner-icon'} %} Frete grátis para SP</h2><p>Para o estado de São Paulo</p><strong>Ver seleção e condições <span aria-hidden="true">→</span></strong></a>
</section>
