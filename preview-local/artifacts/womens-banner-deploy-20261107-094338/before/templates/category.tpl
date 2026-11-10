{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 24 %}
{% endif %}

{% if not show_help %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
{% set has_category_description_without_banner = not category_banner and category.description %}

{% if category_banner %}
    {% include 'snipplets/category-banner.tpl' %}
{% else %}
	<section class="container-fluid mt-3 d-md-none">
		{% embed "snipplets/page-header.tpl" %}
		    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
		{% endembed %}
		{% if has_category_description_without_banner %} 
			<p class="mt-2 mb-3 d-block d-md-none">{{ category.description }}</p> 
		{% endif %}
	</section>
{% endif %}

{% set desktop_category_controls_transparent = settings.filters_desktop_modal and settings.head_fix_desktop and settings.head_transparent and settings.head_transparent_type == 'all' %}

<section class="js-category-controls-prev category-controls-sticky-detector"></section>
<section class="js-category-controls {% if desktop_category_controls_transparent %}js-category-controls-transparent-md category-controls-transparent-md{% endif %} category-controls {% if not settings.filters_desktop_modal %}position-relative-md{% endif %} visible-when-content-ready {% if category_banner %}mt-3{% endif %} {% if has_applied_filters %}mb-2{% else %}mb-3{% endif %} {% if has_category_description_without_banner %}mb-md-0{% endif %}">
	<div class="container-fluid category-controls-container">
		<div class="category-controls-row row">
			<div class="col d-none d-md-block">
				<div class="row align-items-center">
					{% if not category_banner %}
						<div class="col-auto">
							<div class="category-breadcrumbs-container d-none d-md-block">
								{% include "snipplets/breadcrumbs.tpl" %}
							</div>
							{% embed "snipplets/page-header.tpl" with {'breadcrumbs': false, 'heading': false} %}
							    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
							{% endembed %}
						</div>
					{% endif %}
				</div>
			</div>
			<div class="filter-chips-container visible-when-content-ready col-auto text-right d-none d-md-flex">
				{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
			</div>
			{% include "snipplets/grid/filters-modals.tpl" %}
		</div>
	</div>
</section>
{% if has_category_description_without_banner %} 
	<p class="mb-4 container-fluid d-none d-md-block">{{ category.description }}</p> 
{% endif %}
<div class="container-fluid visible-when-content-ready d-md-none {% if has_applied_filters %}pb-2{% endif %}">
	{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
</div>

{% set tf_hide_shipping_labels = (category.name | lower) in ['moda feminina', 'moda masculina', 'moda íntima feminina', 'moda íntima masculina'] %}
<section class="category-body{% if tf_hide_shipping_labels %} tf-hide-shipping-labels{% endif %} mt-2 mt-md-{% if settings.filters_desktop_modal or (not settings.filters_desktop_modal and not has_filters_available) %}0{% else %}4 pt-md-1{% endif %}">
	<div class="container-fluid">
		<div class="row {% if settings.grid_columns_desktop == '3' %}row-md{% endif %}">
			{% include "snipplets/grid/filters-sidebar.tpl" %}
			{% include "snipplets/grid/products-list.tpl" %}
		</div>
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}
