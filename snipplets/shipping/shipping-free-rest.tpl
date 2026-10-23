{% if product_detail %}
	
	{# Wording to notice that adding one more product free shipping is achieved #}

	{% if not product.free_shipping %}
		<div class="js-shipping-add-product-label font-small px-1 mb-2 mt-1 w-100" style="display: none;">
			<span class='js-fs-add-this-product'>{{ "¡Agregá este producto y " | translate }}</span>
			<span class='js-fs-add-one-more' style='display: none;'>{{ "¡Agregá uno más y " | translate }}</span>
			<strong class='text-accent'>{{ "tenés envío gratis!" | translate }}</strong>
		</div>
	{% endif %}
{% else %}
	{{ component('free-shipping-bar', {
		progress_bar_classes: {
			container: 'js-ship-free-rest progress-bar mt-2 mb-5 pb-1',
			title_container: 'progress-bar-title-container',
			title: 'js-ship-free-rest-message ship-free-rest-message progress-bar-title',
			track: 'bar-progress',
			fill: 'bar-progress-active transition-soft',
		},
		show_check: false,
	}) }}
{% endif %}
