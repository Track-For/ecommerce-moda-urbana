{% set has_home_testimonials = false %}
{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
	{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
	{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
	{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
	{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
	{% if has_testimonial %}
		{% set has_home_testimonials = true %}
	{% endif %}
{% endfor %}

{% if has_home_testimonials %}
	<section class="tf-testimonials section-testimonials-home" data-store="home-testimonials">

		{{ component('nubesdk-slot', { type: 'before_section_testimonials' }) }}

		<div class="container">
			<div class="row mb-3{% if settings.testimonials_align == 'center' %} text-center{% elseif settings.testimonials_align == 'asymmetric' %} text-right{% endif %}">
				{% if settings.testimonials_title %}
					<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9 col-md-3{% else %}col-12{% endif %} mb-4">
						<h2 class="subtitle font-weight-normal mb-0">{{ settings.testimonials_title }}</h2>
					</div>
				{% endif %}
				<div class="col-12">
					<div class="js-swiper-testimonials swiper-testimonials swiper-container pt-3">
						<div class="swiper-wrapper">
							{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
								{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
								{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
								{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
								{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
								{% if has_testimonial %}
                                    <div class="swiper-slide slide-container">
                                        <article class="tf-testimonial-card">
                                            <span class="tf-testimonial-mark" aria-hidden="true">&ldquo;</span>
                                            {% if testimonial_description %}
                                                <blockquote class="tf-testimonial-quote">{{ testimonial_description }}</blockquote>
                                            {% endif %}
                                            {% if testimonial_name %}
                                                <h3 class="tf-testimonial-author">{{ testimonial_name }}</h3>
                                            {% endif %}
                                            {% if testimonial_image %}
                                                <a class="tf-testimonial-original" href="{{ "#{testimonial}.jpg" | static_url }}" target="_blank" rel="noopener">
                                                    {{ 'Ver depoimento original' | translate }} <span aria-hidden="true">&nearr;</span>
                                                </a>
                                                {% if not testimonial_description %}
                                                    <img class="tf-testimonial-proof lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "#{testimonial}.jpg" | static_url | settings_image_url('large') }}" alt="{{ testimonial_name | default(store.name) }}" />
                                                {% endif %}
                                            {% endif %}
                                        </article>
                                    </div>
								{% endif %}
							{% endfor %}
						</div>
					</div>
				</div>
				<div class="{% if settings.testimonials_align == 'asymmetric' %}col-9{% else %}col-12{% endif %} d-block d-md-none mt-4">
					<div class="js-swiper-testimonials-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
					<div class="js-swiper-testimonials-pagination swiper-pagination-fraction font-small d-inline-block"></div>
					<div class="js-swiper-testimonials-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-xs"} %}</div>
				</div>
			</div>
		</div>

		{{ component('nubesdk-slot', { type: 'after_section_testimonials' }) }}

	</section>
{% endif %}
