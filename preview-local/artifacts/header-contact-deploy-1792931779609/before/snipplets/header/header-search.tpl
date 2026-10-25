<form class="js-search-container js-search-form {% if settings.search_big_desktop %}search-container {% if (settings.logo_position_desktop == 'center' and settings.hamburger_desktop) or settings.logo_position_desktop == 'left' %}mr-md-2{% endif %} {% if settings.logo_position_desktop == 'left' %}ml-md-2{% endif %}{% endif %}" action="{{ store.search_url }}" method="get">
    <div class="form-group mb-4 m-md-0">
        <input class="js-search-input form-control search-input" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscar' | translate }}" />
        <button type="submit" class="search-input-submit" value="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscar' | translate }}">
            {% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
        </button>
    </div>
</form>
<div class="js-search-suggest search-suggest mr-md-3" style="display: none;">
    {# AJAX container for search suggestions #}
</div>