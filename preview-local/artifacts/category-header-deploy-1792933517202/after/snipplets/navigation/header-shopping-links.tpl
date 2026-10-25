{# Expose real catalog categories directly in desktop and mobile navigation. #}
{% set shopping_navigation = [] %}
{% set promotions_url = settings.tf_header_promotions_url | default('') %}
{% for category in categories %}
    {% set category_label = category.name | lower %}
    {% if category_label in ['promoções', 'promocoes', 'ofertas', 'sale', 'off'] %}
        {% if not promotions_url %}{% set promotions_url = category.url %}{% endif %}
    {% elseif 'frete' not in category_label %}
        {% set shopping_navigation = shopping_navigation | merge([{name: category.name, url: category.url, isCategory: true}]) %}
    {% endif %}
{% endfor %}
{% for item in navigation %}
    {% if item.name | lower in ['promoções', 'promocoes', 'ofertas', 'sale', 'off'] and not promotions_url %}
        {% set promotions_url = item.url %}
    {% endif %}
{% endfor %}
{% if not shopping_navigation %}
    {% for item in navigation %}
        {% if item.name | lower not in ['promoções', 'promocoes', 'ofertas', 'sale', 'off'] %}
            {% set shopping_navigation = shopping_navigation | merge([item]) %}
        {% endif %}
    {% endfor %}
{% endif %}
{% include 'snipplets/navigation/navigation-nav-list.tpl' with {navigation: shopping_navigation} %}
{% if promotions_url %}
    <li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item tf-nav-promotions">
        <a class="nav-list-link" href="{{ promotions_url | setting_url }}">{{ 'Promoções' | translate }}</a>
    </li>
{% endif %}
