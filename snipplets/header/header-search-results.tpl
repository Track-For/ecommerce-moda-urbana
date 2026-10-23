<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item container-fluid">
            <a href="{{ product.url }}" class="search-suggest-link row align-items-center">
                <div class="search-suggest-image-container col-auto pr-0">
                    {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                </div>
                <div class="search-suggest-text col">
                	<p class="search-suggest-name">
                		{{ product.name | highlight(query) }}
                	</p>
                    {% set is_subscription_only = product.isSubscriptionOnly() %}

                    {% if product.display_price %}
                        {% if is_subscription_only %}
                            {{ component('subscriptions/subscription-price', {
                                location: 'product_list',
                                subscription_classes: {
                                    price_compare: 'price-compare',
                                },
                            }) }}
                        {% else %}
                            <p class="search-suggest-price{% if product.isSubscribable() %} mb-0{% endif %}">
                                {{ product.price | money }}
                            </p>
                        {% endif %}
                    {% endif %}

                    {{ component('subscriptions/subscription-message', {
                        subscription_classes: {
                            container: 'font-small',
                        },
                    }) }}
                </div>
            </a>
        </li>
    {% endfor %}
    <div class="text-center my-3">
        <a href="#" class="js-search-suggest-all-link btn-link">{{ 'Ver todos los resultados' | translate }}</a>
    </div>
</ul>
