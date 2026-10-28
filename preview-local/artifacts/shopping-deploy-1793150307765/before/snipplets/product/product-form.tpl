{# Product name and breadcrumbs #}

{% if home_main_product %}

    <h2 class="mb-3">{{ product.name }}</h2>

{% else %}
    {% embed "snipplets/page-header.tpl" %}
        {% block page_header_text %}{{ product.name }}{% endblock page_header_text %}
    {% endembed %}
{% endif %}

{# Product price #}

{% set price_classes = home_main_product ? 'h4 font-large font-weight-normal' : 'h3 font-largest' %}

{% set is_subscription_only_product = product.isSubscribable() and product.isSubscriptionOnly() %}

{{ component('nubesdk-slot', { type: "before_product_detail_price" }) }}

<div class="price-container mb-4" data-store="product-price-{{ product.id }}">
    {% if not is_subscription_only_product %}
    <div class="js-price-container {% if home_main_product %}mb-2{% else %}mb-3{% endif %}">
        <span class="d-inline-block">
        	<div class="js-price-display {{ price_classes }}" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %} data-product-price="{{ product.price }}">{% if product.display_price %}{{ product.price | money }}{% endif %}</div>
        </span>
        <span class="d-inline-flex align-items-center {{ price_classes }} font-weight-normal">
           <div id="compare_price_display" class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</div>
            {{ component('promotional-price-details', {
                svg_sprites: false,
                promotional_price_details_custom_icon: include("snipplets/svg/promotions.tpl", { svg_custom_class: "icon-inline icon-lg icon-w-12" }),
                promotional_price_details_classes: {
                    container: 'tooltip-container position-relative ml-1',
                    trigger: 'tooltip-trigger text-accent',
                    detail_container: 'tooltip-card',
                    detail_row: 'd-flex justify-content-between align-items-center py-1 font-small',
                    detail_divider: 'divider mt-2 mb-2',
                    detail_total: 'font-weight-bold'
                },
            }) }}
        </span>
        {{ component('price-discount-disclaimer', {
            container_classes: 'font-small opacity-60 mt-2 mb-2',
        }) }}
        {{ component('price-without-taxes', {
                container_classes: "mt-1 mb-2 font-small opacity-60",
            })
        }}
        {{ component('payment-discount-price', {
                visibility_condition: settings.payment_discount_price,
                location: 'product',
                container_classes: "h6 font-big font-weight-normal mt-1 mb-2",
                text_classes: {
                    price: 'h5 font-large text-accent',
                },
            })
        }}
    </div>
    {% endif %}

    {{ component('subscriptions/subscription-price', {
        location: is_subscription_only_product ? 'product_detail',
        subscription_classes: {
            container: 'mb-3',
            prices_container: 'd-flex align-items-baseline mb-1',
            price_compare: price_classes ~ ' font-weight-normal price-compare ml-2',
            price_with_subscription: price_classes ~ ' order-first',
            price_info: 'font-smallest',
            discount_container: 'h6 font-weight-normal mt-1 mb-2',
            discount_value: 'text-accent',
            price_without_taxes_container: 'mt-1 mb-2 font-small opacity-60',
        },
    }) }}

    {{ component('nubesdk-slot', { type: "after_product_detail_price" }) }}

    {{ component('nubesdk-slot', { type: "before_product_detail_payment_options" }) }}

    {% set installments_info = product.installments_info_from_any_variant %}
    {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
    {% set show_payments_info = settings.product_detail_installments and product.show_installments and product.display_price and installments_info %}

    {% if not home_main_product and (show_payments_info or hasDiscount) %}
        <div {% if installments_info %}data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments"{% endif %} class="{% if installments_info %}js-modal-open js-fullscreen-modal-open{% endif %} js-product-payments-container mb-4" {% if not product.display_price or not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
    {% endif %}
        {% if show_payments_info %}
            {{ component('installments', {'short_wording' : true, 'location' : 'product_detail', container_classes: { installment: "font-small"}}) }}
        {% endif %}

        {% set hideDiscountContainer = not (hasDiscount and product.showMaxPaymentDiscount) %}
        {% set hideDiscountDisclaimer = not product.showMaxPaymentDiscountNotCombinableDisclaimer %}

        <div class="js-product-discount-container font-small my-1" {% if hideDiscountContainer %}style="display: none;"{% endif %}>
            <span class="text-accent">{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</span> {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}
            {% set max_installments = product.maxPaymentDiscount.maxInstallments %}
            <span
                class="js-payment-discount-installments"
                data-text-singular="{{ 'en {1} cuota' | translate('{1}') }}"
                data-text-plural="{{ 'en {1} cuotas' | translate('{1}') }}"
                {% if not max_installments %}style="display: none;"{% endif %}
            >{{ (max_installments == 1 ? 'en {1} cuota' : 'en {1} cuotas') | translate(max_installments) }}</span>
            <div class="js-product-discount-disclaimer font-small opacity-60 mt-1" {% if hideDiscountDisclaimer %}style="display: none;"{% endif %}>
                {{ (product.showMaxPaymentDiscountCombinesWithSomeDiscounts
                    ? "No acumulable con algunas promociones"
                    : "No acumulable con otras promociones")
                | translate }}
            </div>
        </div>
    {% if not home_main_product and (show_payments_info or hasDiscount) %}
            <a id="btn-installments" class="btn-link font-small" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
              {% if not hasDiscount and not settings.product_detail_installments %}
                {{ "Ver medios de pago" | translate }}
              {% else %}
                {{ "Ver más detalles" | translate }}
              {% endif %}
            </a>
        </div>
    {% endif %}

    {{ component('nubesdk-slot', { type: "after_product_detail_payment_options" }) }}

    {# Product availability #}

    {% set show_product_quantity = product.available and product.display_price %}

    {# Free shipping minimum message #}

    {% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
    {% set has_product_free_shipping = product.free_shipping %}
    {% set shipping_best_discount = cart.free_shipping.min_price_free_shipping %}
    {% set is_full_free_shipping = shipping_best_discount.is_free or not shipping_best_discount.discount_type %}

    {% if not product.is_non_shippable and show_product_quantity and (has_free_shipping or has_product_free_shipping) %}
        <div class="js-free-shipping-minimum-message free-shipping-message pb-1 mb-4 font-small">
            {% if has_product_free_shipping or is_full_free_shipping %}
                {% set shipping_discount_label = "Envío gratis" | translate %}
            {% else %}
                {% set shipping_discount = shipping_best_discount.discount_type == 'percentage'
                    ? (shipping_best_discount.discount_value | round) ~ '%'
                    : shipping_best_discount.discount_value_money
                %}
                {% set shipping_discount_label = shipping_discount ~ ' ' ~ ('our_components.free_shipping_bar.off_shipping' | tt) %}
            {% endif %}
            <span class="text-accent">{{ shipping_discount_label }}</span>
            <span {% if has_product_free_shipping %}style="display: none;"{% else %}class="js-shipping-minimum-label"{% endif %}>
                {{ "superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
            </span>
            {% if not has_product_free_shipping %}
                <div class="js-free-shipping-discount-not-combinable font-small opacity-60 mt-1">
                    {{ "No acumulable con otras promociones" | translate }}
                </div>
            {% endif %}
        </div>
    {% endif %}
</div>

{{ component('promotions-details', {
    promotions_details_classes: {
        container: 'js-product-promo-container mb-4',
        promotion_title: 'mb-2 h6 font-body text-accent',
        valid_scopes: 'font-small mb-0',
        categories_combinable: 'font-small mb-0',
        not_combinable: 'font-small opacity-60 mb-0',
        progressive_discounts_table: 'table mb-2 mt-3',
        progressive_discounts_hidden_table: 'table-body-inverted',
        progressive_discounts_show_more_link: 'btn-link btn-link-primary mb-4',
        progressive_discounts_promotion_quantity: 'font-weight-light text-lowercase'
    },
    svg_sprites: false,
    custom_control_show: include("snipplets/svg/chevron-down.tpl", { svg_custom_class: "icon-inline icon-w-14 icon-md ml-2" }),
    custom_control_hide: include("snipplets/svg/chevron-up.tpl", { svg_custom_class: "icon-inline icon-w-14 icon-md ml-2" }),
}) }}

{# Gift promotion message #}

{{ component('gift-promotion-message', {
    container_classes: {
        container: 'pb-1 mb-4 font-small',
        highlight: 'text-accent',
    },
}) }}

{# Product form, includes: Variants, CTA and Shipping calculator #}

 <form id="product_form" class="js-product-form" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
    {% if template == "product" %}
        {% set show_size_guide = true %}
    {% endif %}
    {% if product.variations %}
        {% include "snipplets/product/product-variants.tpl" with {show_size_guide: show_size_guide} %}
    {% endif %}

    {% if settings.last_product and show_product_quantity %}
        <div class="{% if product.variations %}js-last-product {% endif %}text-accent font-weight-bold mb-4"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
            {{ settings.last_product_text }}
        </div>
    {% endif %}

    {{ component('nubesdk-slot', { type: "before_product_detail_add_to_cart" }) }}

    <div class="form-row mb-2">
        {% if show_product_quantity %}
            {% set product_quantity_container_class = product.isSubscribable() ? 'col-6 col-md-4 mb-3 pb-1' %}
            {% set product_quantity_group_class = product.isSubscribable() ? 'py-2' %}
            {% include "snipplets/product/product-quantity.tpl" with {
                product_quantity_container_class: product_quantity_container_class,
                product_quantity_group_classes: product_quantity_group_class
            } %}
        {% endif %}

        {{ component('subscriptions/subscription-selector', {
            allow_subscription_only: is_subscription_only_product,
            subscription_classes: {
                container: 'col-12 mb-2 pb-1',

                radio_button: 'radio-button-primary',
                radio_button_text: 'row no-gutters',
                purchase_option_info_container: 'col pl-0',
                purchase_option_price: 'col-auto font-weight-bold',
                purchase_option_price_info: 'font-smallest',
                purchase_option_single_frequency: 'mt-2 font-small opacity-80',
                purchase_option_discount: 'text-accent ml-1',

                dropdown_container: 'form-group col-md-9 mt-2 mb-1 pt-1 px-0',
                dropdown_button: 'form-select form-select-small position-relative',
                dropdown_icon: 'form-select-icon',
                dropdown_options: 'form-select-options',
                dropdown_option: 'form-select-option row no-gutters',
                dropdown_option_info: 'col pr-4',
                dropdown_option_price: 'col-auto text-right',
                dropdown_option_price_info: 'font-smallest',
                dropdown_option_discount: 'text-accent mt-1',
                dropdown_option_frequency_info: 'font-small mt-1',

                shipping_message: 'font-small mt-4 mb-3',
                shipping_message_title: 'form-label mb-2 pb-1',
                shipping_message_text: 'box p-3 float-none'
            },
            svg_sprites: false,

            dropdown_icon: true,
            dropdown_custom_icon: include("snipplets/svg/chevron-down.tpl", { svg_custom_class: "icon-inline icon-w-14" }),
        }) }}
        
        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
        <div class="{% if show_product_quantity and not product.isSubscribable() %}col-8{% else %}col-12{% endif %} mb-2">

            {# Add to cart CTA #}

            <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big btn-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

            {# Fake add to cart CTA visible during add to cart event #}

            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}

        </div>

        {% if settings.ajax_cart %}
            <div class="js-added-to-cart-product-message font-small mb-3 mt-1 px-2 {% if settings.product_stock %}mt-4{% endif %}" style="display: none;">
                {% include "snipplets/svg/check.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text mr-2 d-table float-left"} %}
                <span>
                    {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-open-cart js-fullscreen-modal-open btn-link font-small float-right ml-1" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                </span>
            </div>
        {% endif %}

        {# Free shipping visibility message #}

        {% set free_shipping_minimum_label_changes_visibility = has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

        {% set include_product_free_shipping_min_wording = cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

        {% if not product.is_non_shippable and show_product_quantity and has_free_shipping and not has_product_free_shipping and is_full_free_shipping %}

            {# Free shipping add to cart message #}

            {% if include_product_free_shipping_min_wording %}

                {% include "snipplets/shipping/shipping-free-rest.tpl" with {'product_detail': true} %}

            {% endif %}

            {# Free shipping achieved message #}

            <div class="js-product-form-free-shipping-message {% if free_shipping_minimum_label_changes_visibility %}js-free-shipping-message{% endif %} text-accent font-small px-1 mb-2 mt-1 w-100" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
                {{ "¡Genial! Tenés envío gratis" | translate }}
            </div>
        {% endif %}
    </div>

    {{ component('nubesdk-slot', { type: "after_product_detail_add_to_cart" }) }}

    {% if template == 'product' %}

        {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

        {{ component('nubesdk-slot', { type: "before_product_detail_shipping_options" }) }}

        {% if show_product_fulfillment %}

            {# Shipping calculator and branch link #}

            <div id="product-shipping-container" class="product-shipping-calculator list mt-4 mt-md-3" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
                {% if store.has_shipping %}
                    {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                {% endif %}
            </div>

            {% if store.branches %}
                {# Link for branches #}
                {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
            {% endif %}

        {% endif %}

        {{ component('nubesdk-slot', { type: "after_product_detail_shipping_options" }) }}

    {% endif %}

 </form>

{# Product payments details #}

{% include 'snipplets/product/payments-product-details.tpl' %}
