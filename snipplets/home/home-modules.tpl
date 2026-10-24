{% if settings.module and settings.module is not empty %}
    {# Editorial module: keep panel content, image sources and native lazy loading. #}
    <section class="section-banners-home tf-editorial-module{% if settings.module_colors %} section-module-background{% endif %}" data-store="home-image-text-module">
        <div class="container-fluid">
            {% if settings.module_title %}<h2 class="tf-edit-heading">{{ settings.module_title }}</h2>{% endif %}
            <div class="tf-edit-grid tf-edit-count-{% if settings.module | length <= 3 %}small{% elseif settings.module | length <= 5 %}medium{% else %}large{% endif %}">
                {% for slide in settings.module %}
                    <article class="tf-edit-card{% if loop.first %} tf-edit-lead{% endif %}">
                        {% if slide.link %}<a class="tf-edit-link" href="{{ slide.link | setting_url }}"{% if not slide.title %} aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}"{% endif %}>{% endif %}
                            <div class="tf-edit-media">
                                            {% set apply_lazy_load =
                                                settings.home_order_position_1 != 'modules'
                                                or not loop.first
                                            %}

                                            {% if apply_lazy_load %}
                                                {% set slide_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
                                            {% else %}
                                                {% set slide_src = slide.image | static_url | settings_image_url('large') %}
                                            {% endif %}

                                            <img
                                                {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                                {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
                                                {% if apply_lazy_load %}data-{% endif %}src="{{ slide_src }}"
                                                {% if apply_lazy_load %}
                                                data-sizes="auto"
                                                data-expand="-10"
                                                {% endif %}
                                                {% if apply_lazy_load %}data-{% endif %}srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w"
                                                class="tf-edit-image{% if apply_lazy_load %} lazyautosizes lazyload{% endif %}"
                                                {% if slide.title %}alt="{{ slide.title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %}
                                            />

                            </div>
                            {% if slide.title or slide.description or (slide.button and slide.link) %}
                                <div class="tf-edit-caption">
                                    {% if slide.title %}<h3 class="tf-edit-title">{{ slide.title }}{% if slide.link %}<span class="tf-edit-arrow" aria-hidden="true">&#8594;</span>{% endif %}</h3>{% endif %}
                                    {% if slide.description %}<p class="tf-edit-description">{{ slide.description }}</p>{% endif %}
                                    {% if slide.button and slide.link %}<span class="tf-edit-cta">{{ slide.button }}</span>{% endif %}
                                </div>
                            {% endif %}
                        {% if slide.link %}</a>{% endif %}
                    </article>
                {% endfor %}
            </div>
        </div>
    </section>
{% endif %}
