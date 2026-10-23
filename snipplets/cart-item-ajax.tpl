{{ component('nubesdk-slot', { type: "before_line_item", pick: item.id }) }}

{% set is_gift = item.is_gift %}

<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} item cart-item row {% if cart_page %}align-items-md-center{% endif %}" data-item-id="{{ item.id }}" data-gift="{{ is_gift ? 'true' : 'false' }}" data-store="cart-item-{{ item.product.id }}" data-component="cart.line-item">
  {% set hide_compare_price_subtotal = not item.compare_at_price_subtotal or item.is_subscription_item %}
  {% set discount_percentage = item.discount_percentage %}

  {# Cart item image #}
  <div class="{% if cart_page %}col-3 col-md-1{% else %}cart-item-image-col col-auto pr-0{% endif %}">
    <a href="{{ item.url }}">
      <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-fluid {% if not cart_page %}cart-item-image{% endif %}" />
    </a>
  </div>
  <div class="col {% if cart_page %}col-md-10 pl-md-3{% else %}col align-items-center{% endif %}">
    <div class="{% if cart_page %}row align-items-md-center{% else %}w-100{% endif %}">
      
      <div class="{% if cart_page %}col-10 col-md-5 pl-0{% else %}cart-item-name{% endif %}">

        {# Cart item name #}

        <div class="mb-3 {% if cart_page %}mb-md-0 col-md-8 font-md-body{% endif %}" data-component="line-item.name">
          <a href="{{ item.url }}" data-component="name.short-name">
            {{ item.short_name }}
          </a>
          <small data-component="name.short-variant-name">{{ item.short_variant_name }}</small>
          {% if is_gift %}
            <div class="text-accent font-smallest font-weight-bold text-uppercase my-2">
              {{ "Regalo" | translate }}
            </div>
          {% endif %}
          {{ component(
              'cart-labels', {
              group: true,
              subscription_label: true,
              hide_percentage_off_label: true,
              labels_classes: {
                group: 'mt-2',
                label: 'text-accent font-small mb-1',
                subscription: 'font-smallest opacity-80 mt-1 mb-2',
              },
            })
          }}
        </div>
      </div>

      {# Cart item quantity controls #}

      {% set cart_quantity_class = '' %}
      {% if cart_page %}
        {% set cart_quantity_class = 'float-md-none m-auto ' %}
      {% endif %}

      <div class="cart-item-quantity {% if cart_page %}col-7 col-md-3 text-center{% endif %}" data-component="line-item.subtotal">
        {% set cart_qty_margin = '' %}
        {% if cart_page %}
          {% set cart_qty_margin = 'm-md-auto' %}
        {% endif %}
        {% embed "snipplets/forms/form-input.tpl" with{
          type_number: true,
          input_value: item.quantity,
          input_name: 'quantity[' ~ item.id ~ ']',
          input_data_attr: 'item-id',
          input_data_val: item.id,
          input_group_custom_class: cart_quantity_class ~ ' float-left form-quantity cart-item-quantity small mb-0 ' ~ cart_qty_margin,
          input_custom_class: 'js-cart-quantity-input text-center',
          input_label: false, input_append_content: true,
          input_disabled: is_gift,
          data_component: 'quantity.value',
          form_control_container_custom_class: 'js-cart-quantity-container col px-1'} %}
            {% block input_prepend_content %}
            <div class="row m-0 align-items-center ">
              <span class="js-cart-quantity-btn form-quantity-icon btn" onclick="LS.minusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.minus">
                {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-xs"} %}
              </span>
            {% endblock input_prepend_content %}
            {% block input_append_content %}
              
              {# Always place this spinner before the quantity input #}
        
              <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                {% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-spin svg-icon-text"} %}
              </span>

              <span class="js-cart-quantity-btn form-quantity-icon btn" onclick="LS.plusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.plus">
                {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-xs"} %}
              </span>
            </div>
            {% endblock input_append_content %}
        {% endembed %}
      </div>

      {% if cart_page %}
        {# Cart item unit price #}
        <span class="js-cart-item-unit-price cart-item-subtotal-short col-2 text-center d-none d-md-flex flex-column" data-line-item-id="{{ item.id }}">
          {% if is_gift %}
            <span class="price-compare font-small opacity-50">{{ item.compare_at_price | money }}</span>
            <span class="font-weight-bold">{{ "Gratis" | translate }}</span>
          {% else %}
            {{ item.unit_price | money }}
          {% endif %}
        </span>
      {% endif %}

      {# Cart item subtotal #}
      <div class="{% if cart_page %}col-5 col-md-2 text-right text-md-center mt-2 mt-md-0{% else %}cart-item-subtotal{% endif %}">
        {% if is_gift %}
          <div>
            <span class="price-compare font-small opacity-50">{{ item.compare_at_price_subtotal | money }}</span>
          </div>
          <span class="font-weight-bold">{{ "Gratis" | translate }}</span>
        {% else %}
          <div class="js-cart-item-subtotal-compare-price-container" data-line-item-id="{{ item.id }}" {% if hide_compare_price_subtotal %}style="display: none"{% endif %}>
            {% if discount_percentage > 0 %}
              <span class="text-accent font-small font-weight-bold">-{{ discount_percentage }}%</span>
            {% endif %}
            <span class="js-cart-item-subtotal-compare-price price-compare font-small opacity-50" data-line-item-id="{{ item.id }}" data-component="subtotal_compare_price.value" data-component-value='{{ item.compare_at_price_subtotal | money }}'>{{ item.compare_at_price_subtotal | money }}</span>
          </div>
          <span class="js-cart-item-subtotal {% if not hide_compare_price_subtotal %}mt-2{% endif %} font-weight-bold" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value={{ item.subtotal | money }}'>{{ item.subtotal | money }}</span>
					{{ component('subscriptions/cart-prepaid-per-delivery', {
						container_classes: 'font-small opacity-80 mt-1',
						label_classes: 'd-inline-block'
					}) }}
        {% endif %}
      </div>
    </div>
  </div>

  {# Cart item delete #}
  {% if not is_gift %}
    <div class="cart-item-delete col-auto {% if cart_page %}position-relative-md col-md-1 text-md-center{% endif %} text-right" >
      <button type="button" class="btn btn-link" onclick="LS.removeItem({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="line-item.remove">
        {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline icon-w-12"} %}
      </button>
    </div>
  {% endif %}
</div>
