{# Closing editorial links; all commercial content remains panel-owned. #}
{% set editorial_tiles = settings.tf_editorial_tiles %}
{% if not editorial_tiles %}{% set editorial_tiles = settings.module | slice(1, 2) %}{% endif %}
{% if editorial_tiles %}
    <section class="tf-closing-tiles" data-store="home-editorial-tiles">
        {% for tile in editorial_tiles | slice(0, 2) %}
            {% if tile.image %}
                <div class="tf-closing-tile{% if tile.color == 'dark' %} tf-closing-tile-dark{% endif %}">
                    {% if tile.link %}<a href="{{ tile.link | setting_url }}" class="tf-closing-tile-link"{% if not tile.title %} aria-label="{{ store.name }}"{% endif %}>{% endif %}
                        <img class="tf-closing-tile-image lazyautosizes lazyload"
                            data-src="{{ tile.image | static_url | settings_image_url('large') }}"
                            data-srcset="{{ tile.image | static_url | settings_image_url('large') }} 480w, {{ tile.image | static_url | settings_image_url('huge') }} 640w, {{ tile.image | static_url | settings_image_url('original') }} 1024w"
                            data-sizes="auto" alt="{{ tile.title | default(store.name) }}"
                            {% if tile.width and tile.height %}width="{{ tile.width }}" height="{{ tile.height }}"{% endif %}>
                        {% if tile.title %}<h2 class="tf-closing-tile-title">{{ tile.title }}</h2>{% endif %}
                    {% if tile.link %}</a>{% endif %}
                </div>
            {% endif %}
        {% endfor %}
    </section>
{% endif %}
