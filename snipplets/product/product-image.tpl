{% if home_main_product %}
	{% set has_multiple_slides = product.media_count > 1 %}
{% else %}
	{% set has_multiple_slides = product.media_count > 1 or product.video_url %}
{% endif %}
{% set two_images_per_row = settings.product_image_format != 'slider' and settings.product_image_grid == '2' and product.media_count > 1 %}
{% set one_images_per_row = settings.product_image_format != 'slider' and settings.product_image_grid == '1' and product.media_count > 1 %}

{{ component('nubesdk-slot', { type: "before_product_detail_image" }) }}

<div data-store="product-image-{{ product.id }}">
	{% if product.media_count > 0 %}
		<div class="product-image-container {% if has_multiple_slides %}pr-0{% endif %} pr-md-3">
			<div class="js-swiper-product swiper-container {% if settings.product_image_format != 'slider' and not home_main_product %} product-detail-slider{% endif %}" data-product-images-amount="{{ product.media_count }}">

				{{ component('nubesdk-slot', { type: "product_detail_image" }) }}

				{% include 'snipplets/labels.tpl' with {'product_detail': true, 'shipping': true} %}
			<div class="swiper-wrapper">
				{% set image_index = 0 %}
				{% for media in product.media %}
					{% if media.isImage %}
						{% set image_index = image_index + 1 %}
						{% set is_last_image = image_index == product.images_count %}
						<div class="swiper-slide js-product-slide slider-slide {% if not home_main_product %}{% if two_images_per_row %}col-md-6 p-0 {% if settings.product_image_format == 'asymmetric'%}mb-md-0{% else %}mb-md-4 pb-md-2{% endif %} {% if settings.product_image_format == 'asymmetric' and image_index is even %}mt-md-4 pt-md-3{% endif %} {% if image_index is even %}pl-md-3{% else %}pr-md-3{% endif %}{% endif %} {% if settings.product_image_format == 'asymmetric' and one_images_per_row %}{% if image_index is even %}pl-md-5{% else %}pr-md-5{% endif %}  {% if not is_last_image %}mb-md-5{% endif %}{% endif %}{% endif %} {% if is_last_image %}mb-md-0{% endif %}{% if has_multiple_slides %} pr-3 pr-md-0{% endif %}" data-image="{{media.id}}" data-image-position="{{loop.index0}}">
							{% if home_main_product %}
								<div class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
							{% else %}
								<a href="{{ media | product_image_url('4k') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
							{% endif %}

								{% set apply_lazy_load = home_main_product or image_index != 1 %}

								{% if apply_lazy_load %}
									{% set product_image_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
								{% else %}
									{% set product_image_src = media | product_image_url('large') %}
								{% endif %}

								<img 
									{% if not apply_lazy_load %}fetchpriority="high"{% endif %}
									{% if apply_lazy_load %}data-{% endif %}src="{{ product_image_src }}"
									{% if apply_lazy_load %}data-{% endif %}srcset='{{  media | product_image_url('large') }} 480w, {{  media | product_image_url('huge') }} 640w, {{  media | product_image_url('original') }} 1024w, {{  media | product_image_url('1080p') }} 1920w, {{  media | product_image_url('1440p') }} 2560w, {{  media | product_image_url('4k') }} 3840w' 
									class="js-product-slide-img product-slider-image img-absolute img-absolute-centered {% if apply_lazy_load %}lazyautosizes lazyload{% endif %}" 
									{% if apply_lazy_load %}data-sizes="auto"{% endif %}
									{% if media.dimensions.width and media.dimensions.height %}width="{{ media.dimensions.width }}" height="{{ media.dimensions.height }}"{% endif %}
									{% if media.alt %}alt="{{media.alt}}"{% endif %} />

							{% if home_main_product %}
								</div>
							{% else %}
								</a>
							{% endif %}
						</div>
						{% else %}
							{% include 'snipplets/product/product-video.tpl' with {video_id: media.next_video, product_native_video: true, home_main_product: home_main_product} %}
						{% endif %}
					{% endfor %}
					{% if not home_main_product %}
						{% include 'snipplets/product/product-video.tpl' with {video_id: 'yt'} %}
					{% endif %}
				</div>
			</div>
			{% if has_multiple_slides %}
				<div class="product-paginator ml-md-0 {% if not home_main_product and settings.product_image_format != 'slider' %}d-md-none{% endif %} text-left text-md-center mt-3">
					<div class="js-swiper-product-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
					<div class="js-swiper-product-pagination swiper-pagination-fraction font-small d-inline-block"></div>
					<div class="js-swiper-product-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				</div>
			{% endif %}
		</div>
	{% endif %}
</div>

{{ component('nubesdk-slot', { type: "after_product_detail_image" }) }}