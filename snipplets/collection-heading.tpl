{% if params.sort_by == 'best-selling' or params.sort_by == 'created-descending' %}
<section class="mu-collection-heading">
    <p>Explore a Moda Urbana</p>
    <h1>{% if params.sort_by == 'best-selling' %}Mais vendidos{% else %}Novidades{% endif %}</h1>
    <p>{% if params.sort_by == 'best-selling' %}Os produtos mais pedidos, reunidos para você.{% else %}Veja os produtos mais recentes do nosso catálogo.{% endif %}</p>
    <nav aria-label="Coleções"><a href="{{ store.products_url | add_param('sort_by', 'best-selling') }}"{% if params.sort_by == 'best-selling' %} aria-current="page"{% endif %}>Mais vendidos</a><a href="{{ store.products_url | add_param('sort_by', 'created-descending') }}"{% if params.sort_by == 'created-descending' %} aria-current="page"{% endif %}>Novidades</a><a href="{{ store.products_url }}">Todos os produtos</a></nav>
</section>
{% endif %}
