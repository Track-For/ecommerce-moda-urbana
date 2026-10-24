{# Complement the primary showcase with existing campaign and product content. #}
{% if settings.module and settings.module is not empty and sections.primary.products %}
    {% set editorial_banner = settings.module | first %}
    <div class="tf-editorial-pair">
        <div class="tf-pair-campaign">
            {% if editorial_banner.link %}<a href="{{ editorial_banner.link | setting_url }}" class="tf-pair-campaign-link"{% if not editorial_banner.title %} aria-label="{{ store.name }}"{% endif %}>{% endif %}
                <img class="tf-pair-image lazyautosizes lazyload"
                    data-src="{{ editorial_banner.image | static_url | settings_image_url('large') }}"
                    data-srcset="{{ editorial_banner.image | static_url | settings_image_url('large') }} 480w, {{ editorial_banner.image | static_url | settings_image_url('huge') }} 640w, {{ editorial_banner.image | static_url | settings_image_url('1080p') }} 1920w"
                    data-sizes="auto"
                    {% if editorial_banner.width and editorial_banner.height %}width="{{ editorial_banner.width }}" height="{{ editorial_banner.height }}"{% endif %}
                    alt="{{ editorial_banner.title | default(store.name) }}">
                {% if editorial_banner.title %}<div class="tf-pair-caption">{{ editorial_banner.title }}</div>{% endif %}
            {% if editorial_banner.link %}</a>{% endif %}
        </div>
        <div class="tf-pair-products">
            {% for product in sections.primary.products | slice(0, 2) %}
                {% include 'snipplets/grid/item.tpl' with {
                    'slide_item': false,
                    'section_name': 'primary',
                    'section_columns_desktop': 2,
                    'section_columns_mobile': 1,
                    'section_asymmetric': false,
                    'section_asymmetric_slider': false,
                    'appear_transition': false
                } %}
            {% endfor %}
        </div>
    </div>
{% endif %}
