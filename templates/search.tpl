{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 24 %}
{% endif %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false, container: true } %}
	{% block page_header_text %}
		{% if products or has_applied_filters %}
			{{ 'Resultados de búsqueda' | translate }}
		{% else %}
			{{ "No encontramos nada para" | translate }}<span class="ml-2">"{{ query }}"</span>
		{% endif %}
	{% endblock page_header_text %}
{% endembed %}
{% if products or has_applied_filters %}
		<div class="container-fluid d-md-none" >
			<h2 class="h4 {% if has_applied_filters and not products %}mb-0{% else %}mb-3{% endif %}" >
				{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
			</h2>
	</div>
{% endif %}

{% set desktop_category_controls_transparent = settings.filters_desktop_modal and settings.head_fix_desktop and settings.head_transparent and settings.head_transparent_type == 'all' %}

{% if products or has_applied_filters %}
	<section class="js-category-controls-prev category-controls-sticky-detector"></section>
  <section class="js-category-controls {% if desktop_category_controls_transparent %}js-category-controls-transparent-md category-controls-transparent-md{% endif %} category-controls {% if not settings.filters_desktop_modal %}position-relative-md{% endif %} visible-when-content-ready {% if category_banner %}mt-3{% endif %} {% if has_applied_filters %}mb-2{% else %}mb-3{% endif %} {% if has_category_description_without_banner %}mb-md-0{% endif %}">
	<div class="container-fluid category-controls-container">
		<div class="category-controls-row row">
			<div class="col d-none d-md-block">
				<div class="row align-items-center">
						<div class="col-auto">
							<h2 class="h4 mb-0">
								{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
							</h2>
						</div>
				</div>
			</div>
			<div class="filter-chips-container visible-when-content-ready col-auto text-right d-none d-md-flex">
				{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
			</div>
			{% include "snipplets/grid/filters-modals.tpl" %}
		</div>
	</div>
</section>
{% endif %}

<div class="container-fluid visible-when-content-ready d-md-none {% if has_applied_filters %}pb-2{% endif %}">
	{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
</div>

<section class="category-body mt-2 mt-md-{% if settings.filters_desktop_modal or (not settings.filters_desktop_modal and not has_filters_available) %}0{% else %}4 pt-md-1{% endif %}">
	<div class="container-fluid">
		<div class="row {% if settings.grid_columns_desktop == '3' %}row-md{% endif %}">
			{% include "snipplets/grid/filters-sidebar.tpl" %}
			{% include "snipplets/grid/products-list.tpl" %}
		</div>
	</div>
</section>