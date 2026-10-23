{% set noFilterResult = "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." %}
{% set list_data_store = template == 'category' ? 'category-grid-' ~ category.id : 'search-grid' %}

<div class="col {% if settings.filters_desktop_modal and settings.grid_columns_desktop == '2'%}col-md-10 offset-md-1 mt-md-4{% endif %} {% if not settings.filters_desktop_modal %}pr-md-0{% endif %}" data-store="{{ list_data_store }}">
  {% if products %}
    <div class="js-product-table row row-grid products-grid">
      {% include 'snipplets/product_grid.tpl' %}
    </div>
    {% include "snipplets/grid/pagination.tpl" with {infinite_scroll: settings.pagination == 'infinite'} %}
  {% else %}
    <div class="{% if has_applied_filters or template == 'category' %}h6 text-center{% else %}h4 my-4 py-2{% endif %}" data-component="filter.message">
      {% if template == 'category' %}
        {{(has_filters_enabled ? noFilterResult: "Próximamente") | translate}}

      {% elseif template == 'search' %}
        {{ (has_applied_filters ? noFilterResult : "Escribilo de otra forma y volvé a intentar.") | translate }}
      {% endif %}
    </div>
  {% endif %}
</div>