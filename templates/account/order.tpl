{{ component('nubesdk-slot', { type: "before_account_order_header" }) }}

{% embed "snipplets/page-header.tpl" with {container: true} %}
    {% block page_header_text %}
        {%- set page_title = is_subscription ? subscription.id : ('Orden #{1}' | translate(order.number)) -%}
        {{- page_title -}}
    {% endblock page_header_text %}
{% endembed %}

{{ component('nubesdk-slot', { type: "after_account_order_header" }) }}

{% set detail_data_store = is_subscription ? 'account-subscription-detail-' ~ subscription.id : 'account-order-detail-' ~ order.id %}
<section class="account-page">
    <div class="container-fluid" data-store="{{ detail_data_store }}">
        {% if is_subscription %}
            {% set info_icon_class = 'icon-inline mr-1 icon-w svg-icon-text' %}
            {{ component('subscriptions/subscription-detail', {
                subscription: subscription,
                last_order: last_order,
                last_order_items: last_order_items,
                enable_subscription_cancel: true,
                select_custom_icon: include('snipplets/svg/chevron-down.tpl', {svg_custom_class: 'icon-inline icon-w-14 svg-icon-text'}),
                close_custom_icon: include('snipplets/svg/times.tpl', {svg_custom_class: 'icon-inline svg-icon-text'}),
                info_icons: {
                    status_custom_icon: include('snipplets/svg/info-circle.tpl', {svg_custom_class: info_icon_class}),
                    frequency_custom_icon: include('snipplets/svg/history.tpl', {svg_custom_class: info_icon_class}),
                    discount_custom_icon: include('snipplets/svg/promotions.tpl', {svg_custom_class: info_icon_class}),
                    next_order_custom_icon: include('snipplets/svg/calendar.tpl', {svg_custom_class: info_icon_class}),
                    payment_method_custom_icon: include('snipplets/svg/credit-card.tpl', {svg_custom_class: info_icon_class}),
                },
                subscription_classes: {
                    container: 'row',
                    alert: 'col-12 alert mb-3',
                    alert_success: 'alert-success',
                    alert_error: 'alert-danger',
                    info_section: 'col-md-4 mb-3',
                    items_section: 'col-md-8',
                    info: {
                        container: 'mb-4',
                        info_header: 'mt-4 mb-3',
                        info_title: 'h5 d-inline-block m-0',
                        info_action: 'btn-link font-small float-right',
                        info_item: 'font-small mb-2',
                        info_item_value: 'font-weight-bold',
                        address_container: 'font-small mb-2',
                        address_line: 'd-block',
                    },
                    skip_modal: {
                        open_modal_button: 'btn-link font-small float-right pr-0',
                        message: 'mb-2',
                        actions: 'd-flex align-items-center justify-content-end mt-3',
                        back_button: 'btn btn-link mr-3',
                        confirm_button: 'btn btn-primary',
                        modal: 'modal-centered-small modal-centered transition-soft',
                        modal_title: 'flex-grow-1 text-center',
                        header: 'd-flex align-items-center px-3',
                        overlay: 'modal-zindex-top',
                    },
                    cancel_modal: {
                        open_modal_button: 'btn-link font-small float-right pr-0',
                        message: 'mb-2',
                        field: 'form-group',
                        label: 'form-label font-small',
                        select: 'form-control font-small',
                        select_icon: 'form-select-icon',
                        actions: 'd-flex align-items-center justify-content-end mt-3',
                        back_button: 'btn btn-link mr-3',
                        confirm_button: 'btn btn-primary',
                        modal: 'modal-centered-small modal-centered transition-soft',
                        overlay: 'modal-zindex-top',
                        modal_title: 'flex-grow-1 text-center',
                        header: 'd-flex align-items-center px-3',
                    },
                    items: {
                        header: 'd-none d-md-block',
                        header_content: 'row',
                        header_product_label: 'col-6',
                        header_label: 'col-2 text-center',
                        items_container: 'order-detail',
                        item: 'order-item',
                        item_content: 'row align-items-center',
                        product: 'col-7 col-md-6',
                        product_content: 'row align-items-center',
                        image_container: 'col-4 col-md-3 pr-0',
                        image_frame: 'card-img-square-container',
                        image: 'd-block card-img-square',
                        name: 'col-8 col-md-9',
                        name_quantity: 'd-inline-block d-md-none text-center',
                        price: 'col-2 d-none d-md-block text-center',
                        quantity: 'col-2 d-none d-md-block text-center',
                        subtotal: 'col-5 col-md-2 text-center',
                    }
                }
            }) }}
        {% else %}

        {{ component('nubesdk-slot', { type: "before_account_content" }) }}

            {{ component('nubesdk-slot', { type: "before_account_order_detail" }) }}

        {% if cancel_error == 'in_review' or (cancel_success and order.status != 'cancelled') %}
            {% if cancel_error == 'in_review' and store.cancel_review_time %}
                {% if store.cancel_review_time_unit == 'hours' %}
                    {% set cancel_review_message = 'La tienda tiene hasta {1} hs para revisarla. Te avisaremos el resultado por email a {2}.' | translate(store.cancel_review_time, customer.email) %}
                {% else %}
                    {% set cancel_review_message = 'La tienda tiene hasta {1} días para revisarla. Te avisaremos el resultado por email a {2}.' | translate(store.cancel_review_time, customer.email) %}
                {% endif %}
            {% else %}
                {% set cancel_review_message = 'Te avisaremos el resultado por email a {1}.' | translate(customer.email) %}
            {% endif %}
            <div class="alert alert-info mb-3">
                <span class="font-weight-bold">{{ 'Tu solicitud de cancelación está siendo revisada' | translate }}</span>
                <p class="mt-1 mb-0">{{ cancel_review_message }}</p>
            </div>
        {% endif %}
    	<div class="row">
            <div class="col-md-4 mb-3">
                <div class="mb-4">
                    {% if log_entry %}
                        <h4>{{ 'Estado actual del envío' | translate }}:</h4>{{ log_entry }}
                    {% endif %}
                    <h5 class="d-inline-block mb-4">{{ 'Detalles' | translate }}</h5>
                    <p class="font-small">
                        {% include "snipplets/svg/calendar.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Fecha' | translate}}: <strong>{{ order.date | i18n_date('%d/%m/%Y') }}</strong> 
                    </p>
                    <p class="font-small">
                        {% include "snipplets/svg/info-circle.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Estado' | translate}}: <strong>{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : (order.status == 'cancellation_pending'? 'Cancelación pendiente' : 'Cancelada'))) | translate }}</strong>
                    </p>
                    <p class="font-small">
                        {% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Pago' | translate}}: <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }} </strong>
                    </p>
                    <p class="font-small">
                        {% include "snipplets/svg/usd-circle.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Medio de pago' | translate}}: <strong>{{ order.payment_name }}</strong>
                    </p>

                    {% if order.address %}
                        <p class="font-small">
                            {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Envío' | translate}}: <strong>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : (order.shipping_status == 'delivered'? 'Entregado' : 'No enviado')) | translate }}</strong>
                        </p>
                        <p class="font-small"> 
                            {% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} <strong>{{ 'Dirección de envío' | translate }}:</strong>
                            <span class="d-block d-block mt-1 pl-4">
                                {{ order.address | format_address }}
                            </span>
                        </p>
                    {% endif %}
                    {% if order_subscription %}
                        {{ component('subscriptions/subscription-summary', {
                            order_subscription: order_subscription,
                            subscription_classes: {
                                info_title: 'font-weight-bold mb-2 mt-3',
                                info_item: 'font-small mb-2',
                                info_item_value: 'font-weight-bold',
                            },
                        }) }}
                    {% endif %}
                </div>
                {{ component('cancel-order-modal', {
                    close_custom_icon: include('snipplets/svg/times.tpl', { svg_custom_class: 'icon-inline' }),
                    select_custom_icon: include('snipplets/svg/chevron-down.tpl', { svg_custom_class: 'icon-inline' }),
                    classes: {
                        open_modal_button: 'btn btn-secondary d-inline-block my-2',
                        header: 'd-flex align-items-center px-3',
                        close_button: 'ml-auto',
                        modal_title: 'h4',
                        modal: 'modal-centered-small modal-centered',
                        message: 'mb-2',
                        warning: 'mb-3',
                        label: 'form-label',
                        actions: 'text-right mt-3',
                        back_button: 'btn btn-link mr-3',
                        confirm_button: 'btn btn-primary',
                        field: 'position-relative',
                        select: 'w-100',
                        select_icon: 'mt-2'
                    }
                }) }}
            </div>
            <div class="col-md-8">

                {{ component('nubesdk-slot', { type: "before_account_order_items" }) }}

                <h5 class="mb-3 mb-md-4">{{ 'Productos' | translate }}</h5>
                <div class="d-none d-md-block">
                    <div class="row">
                        <div class="col-6">
                            <p>{{ 'Producto' | translate }}</p>
                        </div>
                        <div class="col-2 text-center">
                            <p>{{ 'Precio' | translate }}</p>
                        </div>
                        <div class="col-2 text-center">
                            <p>{{ 'Cantidad' | translate }}</p>
                        </div>
                        <div class="col-2 text-center">
                            <p>{{ 'Total' | translate }}</p>
                        </div>
                    </div>
                </div>
                <div class="order-detail">
                    {% for item in order.items %}
                        <div class="order-item">
                            <div class="row align-items-center">
                                <div class="col-7 col-md-6">
                                    <div class="row align-items-center">
                                        <div class="col-4 col-md-3 pr-0">
                                            <div class="card-img-square-container">
                                                {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'd-block card-img-square'}) }} 
                                            </div>
                                        </div>
                                        <div class="col-8 col-md-9">
                                            <p>
                                                {{ item.name }} <span class="d-inline-block d-md-none text-center">x{{ item.quantity }}</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 d-none d-md-block text-center">
                                    <p>
                                        {{ item.unit_price | money }}
                                    </p>
                                </div>
                                <div class="col-2 d-none d-md-block text-center">
                                    <p>
                                        {{ item.quantity }}
                                    </p>
                                </div>
                                <div class="col-5 col-md-2 text-center">
                                    <p>
                                        {{ item.subtotal | money }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    {% endfor %}

                    {{ component('nubesdk-slot', { type: "after_account_order_items" }) }}

                    {% if order.show_shipping_price %}
                        <p class="mt-3">
                            <strong class="font-small">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</strong>
                            {% if order.shipping == 0  %}
                                {{ 'Gratis' | translate }}
                            {% else %}
                                {{ order.shipping | money_long }}
                            {% endif %}
                        </p>
                    {% else %}
                        <p class="mt-3">
                            <strong class="font-small">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</strong>
                            {{ 'A convenir' | translate }}
                        </p>
                    {% endif %}
                    {% if order.discount %}
                        <p class="mt-3">
                           <strong class="font-small">{{ 'Descuento ({1})' | translate(order.coupon) }}:</strong>
                            - {{ order.discount | money }}
                        </p>
                    {% endif %}
                    {% if order.shipping or order.discount %}
                        <p class="mt-3">
                            <strong class="font-small">{{ 'Subtotal' | translate }}:</strong>
                            {{ order.subtotal | money }}
                        </p>
                    {% endif %}  
                    <h3 class="font-huge">{{ 'Total' | translate }}: {{ order.total | money }}</h3>
                    {% if order.pending %}
                        <a class="btn btn-primary mt-2 d-block col col-md-4" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar el pago' | translate }}</a>
                    {% endif %}
                </div>
            </div>
    	</div>

            {{ component('nubesdk-slot', { type: "after_account_order_detail" }) }}

        {{ component('nubesdk-slot', { type: "after_account_content" }) }}

        {% endif %}
    </div>
</section>