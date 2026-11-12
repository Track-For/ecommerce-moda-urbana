<li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item mu-nav-collection"><a class="nav-list-link" href="{{ store.products_url | add_param('sort_by', 'best-selling') }}">Mais vendidos</a></li>
<li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item mu-nav-collection"><a class="nav-list-link" href="{{ store.products_url | add_param('sort_by', 'created-descending') }}">Novidades</a></li>
<li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item mu-nav-shipping"><a class="nav-list-link" href="/frete-gratis/">{% include 'snipplets/svg/truck.tpl' with {svg_custom_class: 'mu-nav-shipping-icon'} %}<span>Frete grátis para SP</span></a></li>
{# Render native collections without merging platform objects. #}
{% if categories %}
    {% for category in categories %}
        {% if 'moda-intima-feminina' not in (category.url | lower) and (category.name | lower) != 'moda íntima feminina' and category.name != 'FRETE GRÁTIS' and 'masculin' not in (category.name | lower) and 'cueca' not in (category.url | lower) %}
            <li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item">
                <a class="nav-list-link" href="{{ category.url | replace('modaurbanaoutlet.com.br', 'modaurbanaoficial.com.br') }}">{{ category.name }}</a>
            </li>
        {% endif %}
    {% endfor %}
{% else %}
    {% for item in navigation %}
        {% if 'moda-intima-feminina' not in (item.url | lower) and (item.name | lower) != 'moda íntima feminina' and item.isCategory and 'masculin' not in (item.name | lower) and 'cueca' not in (item.url | lower) %}
            <li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item">
                <a class="nav-list-link" href="{{ item.url | setting_url | replace('modaurbanaoutlet.com.br', 'modaurbanaoficial.com.br') }}">{{ item.name }}</a>
            </li>
        {% endif %}
    {% endfor %}
{% endif %}
{% if settings.tf_header_promotions_url %}
    <li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item tf-nav-promotions">
        <a class="nav-list-link" href="{{ settings.tf_header_promotions_url | setting_url | replace('modaurbanaoutlet.com.br', 'modaurbanaoficial.com.br') }}">Promoções</a>
    </li>
{% endif %}
