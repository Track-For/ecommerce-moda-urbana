{% embed "snipplets/page-header.tpl" with {container: true} %}
    {% block page_header_text %}{{ "Mi cuenta" | translate }}{% endblock page_header_text %}
{% endembed %}

<section class="account-page">
    <div class="container-fluid">

        {{ component('nubesdk-slot', { type: "before_account_content" }) }}

        <div class="row">
            <div class="col-md-4">
                <div class="mb-4 pb-md-2"> 
                    <div class="mb-0">
                        <h5 class="d-inline-block mb-3">{{ 'Datos Personales' | translate }}</h5>
                        {{ 'Editar' | translate | a_tag(store.customer_info_url, '', 'btn-link font-small float-right') }}
                    </div>
                    <p class="font-small mb-0">
                        <strong>
                            {{customer.name}}
                        </strong>
                        <span class="d-block">
                            {{customer.email}}
                        </span>
                        {% if customer.cpf_cnpj %}
                            <span class="d-block">
                                <strong>{{ 'DNI / CUIT' | translate }}:</strong> {{ customer.cpf_cnpj | format_id_number(customer.billing_country) }}
                            </span>
                        {% endif %}

                        {% if customer.business_name %}
                            <span class="d-block">
                                <strong>{{ 'Razón social' | translate }}:</strong> {{ customer.business_name }}
                            </span>
                        {% endif %}
                        {% if customer.trade_name %}
                            <span class="d-block">
                                <strong>{{ 'Nombre comercial' | translate }}:</strong> {{ customer.trade_name }}
                            </span>
                        {% endif %}
                        {% if customer.state_registration %}
                            <span class="d-block">
                                <strong>{{ 'Inscripción estatal' | translate }}:</strong> {{ customer.state_registration }}
                            </span>
                        {% endif %}
                        {# Giro business activity used only by CL stores #}
                        {% if customer.business_activity %}
                            <span class="d-block">
                                <strong>{{ 'Giro' | translate }}:</strong> {{ customer.business_activity }}
                            </span>
                        {% endif %}
                        {% if customer.fiscal_regime %}
                            <span class="d-block">
                                <strong>{{ 'Régimen fiscal' | translate }}:</strong> {{ customer.fiscal_regime | format_fiscal_regime }}
                            </span>
                        {% endif %}

                        {% if customer.phone %}
                            <span class="d-block">
                               <strong>{{ 'Teléfono' | translate }}:</strong> {{ customer.phone }}
                            </span>
                        {% endif %}
                    </p>
                </div>
                {% if customer.default_address %}
                    <div class="mb-4 pb-2">
                        <div class="mb-0">
                            <h5 class="d-inline-block mb-3">{{ 'Mis direcciones' | translate }}</h5>
                            {{ 'Editar' | translate | a_tag(store.customer_address_url(customer.default_address), '', 'btn-link font-small float-right') }}
                        </div>

                        <p class="mb-0">
                            <span class="d-block font-small my-2">
                                {{ customer.default_address | format_address_short }}
                            </span>
                            {{ 'Otras direcciones' | translate | a_tag(store.customer_addresses_url, '', 'btn-link font-small') }}
                        </p>
                    </div>
                {% endif %}
            </div>
            <div class="col-md-8 pl-md-5">
                {% if cancel_success %}
                    <div class="alert alert-success mb-3">{{ 'Tu solicitud de cancelación fue enviada exitosamente.' | translate }}</div>
                {% elseif cancel_error %}
                    <div class="alert alert-danger mb-3">{{ 'Recibimos tu solicitud de cancelación. Vamos a revisarla y te avisaremos el resultado por email a {1}.' | translate(customer.email) }}</div>
                {% endif %}
                {{ component('subscriptions-list', {
                    subscriptions: subscriptions,
                    svg_sprites: false,
                    icons: {
                        toggle_custom_icon: include('snipplets/svg/chevron-down.tpl', {svg_custom_class: 'icon-inline icon-w-14 icon-lg svg-icon-text'}),
                        toggle_active_custom_icon: include('snipplets/svg/chevron-left.tpl', {svg_custom_class: 'icon-inline icon-w-14 icon-lg svg-icon-text'}),
                        last_order_custom_icon: include('snipplets/svg/calendar.tpl', {svg_custom_class: 'icon-inline mr-1 icon-w svg-icon-text'}),
                        shipping_custom_icon: include('snipplets/svg/truck.tpl', {svg_custom_class: 'icon-inline mr-1 icon-w svg-icon-text'}),
                        next_order_custom_icon: include('snipplets/svg/calendar.tpl', {svg_custom_class: 'icon-inline mr-1 icon-w svg-icon-text'}),
                    },
                    subscriptions_classes: {
                        wrapper: 'mb-4',
                        title: 'h5 d-inline-block mb-3',
                        grid: 'row',
                        item_container: 'col-md-6 mb-3',
                        item: 'box p-0 card mb-0',
                        item_header: 'card-header',
                        item_header_content: 'row align-items-center',
                        item_header_link_container: 'col',
                        item_header_link: 'btn-link font-weight-bold',
                        item_header_toggle: 'col-auto d-flex align-items-center',
                        item_header_status_wrapper: 'm-0 mr-2',
                        item_header_status_active: 'label label-small label-outline label-outline-success',
                        item_header_status_cancelled: 'label label-small label-outline',
                        item_body: 'card-body pt-0',
                        item_body_content: 'row',
                        item_body_text_container: 'col-7',
                        item_body_text: 'font-small mb-2',
                        item_body_detail_link: 'btn-link font-small d-block mb-2',
                        item_body_image_container: 'col-5',
                        item_body_image_wrapper: 'card-img-square-container',
                        item_body_image: 'card-img-square',
                        item_footer: 'card-footer p-0 mt-4',
                        item_footer_button: 'btn btn-primary btn-medium d-block',
                    }
                }) }}
                <div class="row" data-store="account-orders">
                    {% if customer.orders %}
                        {% if customer.ordersCount > 50 %}
                            <div class="col-12 h5 mb-3">
                                {{ 'Últimas 50 órdenes' | translate }}
                            </div>
                        {% endif %}
                        {% for order in customer.orders %}
                            {% set add_checkout_link = order.pending %}
                            <div class="col-md-6" data-store="account-order-item-{{ order.id }}">

                                {{ component('nubesdk-slot', { type: "before_account_order_item", pick: order.id }) }}

                                {% embed "snipplets/card.tpl" with{card_footer: true, card_custom_class: 'box card-collapse', card_collapse: true} %}
                                    {% block card_head %}
                                        <div class="row">
                                            <div class="col">
                                                <a class="btn-link" href="{{ store.customer_order_url(order) }}"><strong>{{'Orden' | translate}}: #{{order.number}}</strong></a>
                                            </div>
                                            <div class="js-card-collapse-toggle col text-right">
                                                <p class="m-0"><small>{{ order.date | i18n_date('%d/%m/%Y') }}</small></p>
                                            </div>
                                        </div>
                                    {% endblock %}
                                    {% block card_body %}
                                    <div class="container container-fluid p-0">
                                        <div class="row">
                                            <div class="col-7">
                                                <p class="font-small mb-2">
                                                    {% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Pago' | translate}}: <span class="{{ order.payment_status }}"> <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong></span>
                                                </p>
                                                <p class="font-small">
                                                    {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Envío' | translate}}: <strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : (order.shipping_status == 'delivered'? 'Entregado' : 'No enviado')) | translate }} </strong>
                                                </p>
                                                <h4 class="font-large m-0 mt-4">
                                                    <strong>{{'Total' | translate}}</strong> {{ order.total | money }}
                                                </h4>
                                                <a class="btn-link font-small" href="{{ store.customer_order_url(order) }}">{{'Ver detalle >' | translate}}</a>
                                            </div>

                                            <div class="col-5">
                                                <div class="card-img-square-container">
                                                    {% for item in order.items %}
                                                        {% if loop.first %} 
                                                            {% if loop.length > 1 %} 
                                                                <span class="card-img-pill">{{ loop.length }} {{'Productos' | translate }}</span>
                                                            {% endif %}
                                                            {{ item.featured_image | product_image_url("") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                                        {% endif %}
                                                    {% endfor %}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {% endblock %}
                                    {% block card_foot %}
                                        {% if add_checkout_link %}
                                            <a class="btn btn-primary btn-medium d-block" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                                        {% elseif order.order_status_url != null %}
                                            <a class="btn btn-primary btn-medium d-block" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                        {% endif %}
                                        {{ component('cancel-order-modal', {
                                            redirect_to: store.customer_order_url(order),
                                            close_custom_icon: include('snipplets/svg/times.tpl', { svg_custom_class: 'icon-inline' }),
                                            select_custom_icon: include('snipplets/svg/chevron-down.tpl', { svg_custom_class: 'icon-inline' }),
                                            classes: {
                                                open_modal_button: 'btn btn-secondary btn-medium d-block mt-2',
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
                                    {% endblock %}
                                {% endembed %}

                                {{ component('nubesdk-slot', { type: "after_account_order_item", pick: order.id }) }}

                            </div>
                        {% endfor %}
                    {% else %}
                    <div class="col text-center">
                        {% include "snipplets/svg/cart.tpl" with {svg_custom_class: "icon-inline mr-1 icon-lg svg-icon-primary"} %}
                        <p class="mt-2">{{ '¡Hacé tu primera compra!' | translate }}</p>
                        {{ 'Ir a la tienda' | translate | a_tag(store.url, '', 'btn btn-primary btn-block mt-2') }}
                    </div>
                    {% endif %}
                </div>
            </div>
        </div>

        {{ component('nubesdk-slot', { type: "after_account_content" }) }}

    </div>
</section>
