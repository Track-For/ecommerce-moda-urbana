{% if product.video_url or product_native_video %}
	{% if product.media_count > 1 %}
		{% set video_index = product.media_count %}
	{% else %}
		{% set video_index = 1 %}
	{% endif %}
	{% if product_native_video %}
		{% set video_index = loop.index0 %}
	{% endif %}

	{% set has_one_image_with_grid = product.media_count == 1 and settings.product_image_format != 'slider' %}
	{% set add_top_margin_md = has_one_image_with_grid or settings.product_image_format != 'slider' %}

	<div class="js-product-slide js-product-video-slide swiper-slide slider-slide mb-0 {% if product_native_video %}product-native-video-slide{% endif %} {% if home_main_product %}w-100{% endif %} {% if add_top_margin_md %}mt-md-4{% endif %} {% if has_one_image_with_grid and settings.product_image_grid == '1' %}pr-md-5{% endif %} pr-3 pr-md-0" data-image-position="{{ video_index }}">
		<div class="product-video-container">
			<div class="product-video">

				{# Visible video inside slider #}
				{% include 'snipplets/video-item.tpl' with {video_id: video_id, product_modal_trigger: true, product_video: true, product_native_video: product_native_video} %}

				{# Hidden video inside modal #}
				{% include 'snipplets/video-item.tpl' with {video_id: video_id, product_modal: true, product_video: true, product_native_video: product_native_video} %}
			</div>
		</div>
	</div>
{% endif %}