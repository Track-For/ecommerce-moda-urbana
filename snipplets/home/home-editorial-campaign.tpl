{# A dedicated campaign can replace the existing second module in the panel. #}
{% set editorial_campaign = settings.tf_editorial_campaign | first %}
{% if not editorial_campaign and settings.module | length > 1 %}
    {% set editorial_campaign = settings.module | slice(1, 1) | first %}
{% endif %}
{% if editorial_campaign and editorial_campaign.image %}
    <section class="tf-wide-campaign{% if editorial_campaign.color == 'dark' %} tf-wide-campaign-dark{% endif %}" data-store="home-editorial-campaign">
        {% if editorial_campaign.link %}<a href="{{ editorial_campaign.link | setting_url }}" class="tf-wide-campaign-link"{% if not editorial_campaign.title %} aria-label="{{ store.name }}"{% endif %}>{% endif %}
            <img class="tf-wide-campaign-image lazyautosizes lazyload"
                data-src="{{ editorial_campaign.image | static_url | settings_image_url('large') }}"
                data-srcset="{{ editorial_campaign.image | static_url | settings_image_url('large') }} 480w, {{ editorial_campaign.image | static_url | settings_image_url('huge') }} 640w, {{ editorial_campaign.image | static_url | settings_image_url('1080p') }} 1920w"
                data-sizes="auto"
                {% if editorial_campaign.width and editorial_campaign.height %}width="{{ editorial_campaign.width }}" height="{{ editorial_campaign.height }}"{% endif %}
                alt="{{ editorial_campaign.title | default(store.name) }}">
            <div class="tf-wide-campaign-copy">
                {% if editorial_campaign.title %}<h2>{{ editorial_campaign.title }}</h2>{% endif %}
                {% if editorial_campaign.description %}<p>{{ editorial_campaign.description }}</p>{% endif %}
            </div>
            {% if editorial_campaign.button and editorial_campaign.link %}<span class="tf-wide-campaign-cta">{{ editorial_campaign.button }} <span aria-hidden="true">&#8594;</span></span>{% endif %}
        {% if editorial_campaign.link %}</a>{% endif %}
    </section>
{% endif %}
