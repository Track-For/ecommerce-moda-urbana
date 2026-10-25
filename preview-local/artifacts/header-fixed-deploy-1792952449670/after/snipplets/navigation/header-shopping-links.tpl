{# Render native collections without merging platform objects. #}
{% if categories %}
    {% for category in categories %}
        {% if category.name != 'FRETE GRÁTIS' %}
            <li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item">
                <a class="nav-list-link" href="{{ category.url }}">{{ category.name }}</a>
            </li>
        {% endif %}
    {% endfor %}
{% else %}
    {% for item in navigation %}
        {% if item.isCategory %}
            <li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item">
                <a class="nav-list-link" href="{{ item.url | setting_url }}">{{ item.name }}</a>
            </li>
        {% endif %}
    {% endfor %}
{% endif %}
{% if settings.tf_header_promotions_url %}
    <li class="nav-item nav-item-desktop js-desktop-nav-item js-nav-main-item nav-main-item tf-nav-promotions">
        <a class="nav-list-link" href="{{ settings.tf_header_promotions_url | setting_url }}">Promoções</a>
    </li>
{% endif %}
