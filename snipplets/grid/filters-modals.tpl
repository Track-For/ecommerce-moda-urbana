{% if products and (not settings.filters_desktop_modal or not has_filters_available) %}
	<div class="col-auto {% if has_filters_available and not settings.filters_desktop_modal %}d-none d-md-block{% endif %} {% if settings.product_grid_asymmetric and settings.grid_columns_desktop != '3' %}filters-asymmetric{% endif %}">
		<a href="#" class="js-modal-open btn btn-link" data-toggle="#sort-by">
			{{ 'Ordenar' | t }}
		</a>
		{% embed "snipplets/modal.tpl" with{modal_id: 'sort-by', modal_class: 'bottom modal-centered modal-bottom-sheet modal-right-md', modal_position: 'bottom', modal_position_desktop: right, modal_width: 'docked-md', modal_transition: 'slide', modal_header_title: true} %}
			{% block modal_head %}
				{{'Ordenar' | translate }}
			{% endblock %}
			{% block modal_body %}
				{{ component(
					'sort-by',{
						list: true,
						list_title: false,
						svg_sprites: false,
						sort_by_classes: {
							list: "list-unstyled",
							radio_button: "radio-button",
							radio_button_content: "radio-button-content",
							radio_button_icons_container: "radio-button-icons-container",
							radio_button_icons: "radio-button-icons",
							radio_button_icon: "radio-button-icon",
							radio_button_label: "radio-button-label",
							applying_feedback_message: 'h5 mr-2',
						},
						applying_feedback_custom_icon: include("snipplets/svg/circle-notch.tpl",  {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"}),
					})
				}}
				<div class="js-sorting-overlay filters-overlay" style="display: none;">
					<div class="filters-updating-message">
						<span class="h5 mr-2">{{ 'Ordenando productos' | translate }}</span>
						<span>
							{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
						</span>
					</div>
				</div>
			{% endblock %}
		{% endembed %}
	</div>
{% endif %}
{% if products and has_filters_available %}
	<div class="visible-when-content-ready col-auto {% if not settings.filters_desktop_modal %}d-md-none{% endif %} {% if settings.product_grid_asymmetric and settings.grid_columns_desktop != '3' %}filters-asymmetric{% endif %}">
		<a href="#" class="js-modal-open js-fullscreen-modal-open btn btn-link" data-toggle="#nav-filters" data-modal-url="modal-fullscreen-filters" data-component="filter-button">
			{{ 'Filtrar y ordenar' | t }}
		</a>
		{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters', modal_position: 'left', modal_position_desktop: 'right', modal_transition: 'slide', modal_header_title: true, modal_width: 'docked-md', modal_mobile_full_screen: 'true' } %}
			{% block modal_head %}
				{{'Filtrar y ordenar' | translate }}
			{% endblock %}
			{% block modal_body %}
				<div class="{% if not settings.filters_desktop_modal %}d-md-none{% endif %} mb-3 pb-3">
					<div class="h6 font-body mb-3">{{ 'Ordenar' | translate }}</div>
					{{ component(
						'sort-by',{
							list: true,
							list_title: false,
							svg_sprites: false,
							sort_by_classes: {
								list: "list-unstyled",
								radio_button: "radio-button",
								radio_button_content: "radio-button-content",
								radio_button_icons_container: "radio-button-icons-container",
								radio_button_icons: "radio-button-icons",
								radio_button_icon: "radio-button-icon",
								radio_button_label: "radio-button-label",
								applying_feedback_message: 'h5 mr-2',
							},
							applying_feedback_custom_icon: include("snipplets/svg/circle-notch.tpl",  {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"}),
						})
					}}
				</div>
				{% if has_filters_available %}
					{% if filter_categories is not empty %}
						{% include "snipplets/grid/categories.tpl" with {modal: true} %}
					{% endif %}
					{% if product_filters is not empty %}
							{% include "snipplets/grid/filters.tpl" with {modal: true} %}
						{% endif %}
					<div class="js-filters-overlay filters-overlay" style="display: none;">
						<div class="filters-updating-message">
							<span class="js-applying-filter h5 mr-2" style="display: none;">{{ 'Aplicando filtro' | translate }}</span>
							<span class="js-removing-filter h5 mr-2" style="display: none;">{{ 'Borrando filtro' | translate }}</span>
							<span class="js-filtering-spinner" style="display: none;">
								{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
							</span>
						</div>
					</div>
				{% endif %}
				<div class="js-sorting-overlay filters-overlay" style="display: none;">
					<div class="filters-updating-message">
						<span class="h5 mr-2">{{ 'Ordenando productos' | translate }}</span>
						<span>
							{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
						</span>
					</div>
				</div>
			{% endblock %}
		{% endembed %}
	</div>
{% endif %}
{% if products | length > 1 %}
	<div class="visible-when-content-ready col d-md-none text-right {% if settings.product_grid_asymmetric and settings.grid_columns_mobile == '2' %}products-amount-asymmetric{% endif %}">
		{{ products_count }} {{ 'productos' | translate }}
	</div>
{% endif %}
