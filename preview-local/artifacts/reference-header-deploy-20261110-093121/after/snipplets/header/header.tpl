{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{# Header #}
{# Compact brand header; native utility handlers and destinations are retained. #}
{% set tf_compact_header = true %}

{# Conditions for transparent head on page load #}

{# Slider and video presence #}

{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_slider = has_main_slider or has_mobile_slider %}
{% set has_slider_above_the_fold = settings.home_order_position_1 == 'slider' and has_slider %}
{% set has_video_above_the_fold = settings.home_order_position_1 == 'video' and settings.video_embed %}
{% set is_video_or_slider_above_the_fold = template == 'home' and (has_slider_above_the_fold or has_video_above_the_fold) %}

{# Transparent head conditions #}

{% set head_transparent_type_on_section = template == 'home' and settings.head_transparent and settings.head_transparent_type == 'slider_and_video' and (has_slider or settings.video_embed) %}
{% set head_transparent_type_on_section_above_the_fold = settings.head_transparent and is_video_or_slider_above_the_fold %}
{% set head_transparent_type_always = settings.head_transparent and settings.head_transparent_type == 'all' %}
{% set head_transparent = (head_transparent_type_on_section or head_transparent_type_always) %}

{% if head_transparent and is_video_or_slider_above_the_fold %}
    {% set head_position_mobile = 'position-fixed' %}
{% else %}
    {% set head_position_mobile = 'position-sticky' %}
{% endif %}

{% if settings.head_fix_desktop %}
    {% set head_position_desktop = head_transparent and is_video_or_slider_above_the_fold ? 'position-fixed-md' : 'position-sticky-md' %}
{% elseif head_transparent and is_video_or_slider_above_the_fold %}
    {% set head_position_desktop = 'position-absolute-md' %}
{% else %}
    {% set head_position_desktop = 'position-relative-md' %}
{% endif %}

{% set has_account_links = settings.account_header %}

<header class="tf-header mu-reference-header js-head-main {% if head_transparent %}js-head-mutator{% endif %} {% if head_transparent_type_always %}head-transparent{% endif %} {% if head_transparent_type_on_section_above_the_fold %}head-transparent-on-section{% endif %} {% if head_transparent and settings.head_transparent_contrast_options %}head-transparent-contrast{% endif %} head-main {{ head_position_mobile }} {{ head_position_desktop }} transition-soft" data-store="head">
    <div class="tf-shipping-announcement">Frete Grátis para o estado de São Paulo</div>
    {# Adversiting bar #}
    {% if settings.ad_bar %}
        {% snipplet "header/header-advertising.tpl" %}
    {% endif %}
    <div class="container-fluid">
        <div class="js-nav-logo-bar mu-brand-row">
            <div class="mu-mobile-menu d-md-none header-utility">
                {% include "snipplets/header/header-utilities.tpl" with {use_menu: true} %}
            </div>
            <div class="js-logo-col mu-header-logo">
                {% include "snipplets/header/header-logo.tpl" %}
            </div>
            <div class="mu-header-search js-search-utility">
                {% include "snipplets/header/header-search.tpl" with {header_search: true} %}
            </div>
            <div class="tf-header-actions d-flex align-items-center justify-content-end">
                <a class="mu-service-link mu-orders-link" href="{{ store.customer_home_url | default(store.customer_login_url) }}">
                    {% include "snipplets/svg/truck.tpl" with {svg_custom_class: 'icon-inline'} %}
                    <span>Meus pedidos</span>
                </a>
                <a class="mu-service-link mu-returns-link" href="/trocas-e-devolucoes/">
                    <svg class="icon-inline" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" aria-hidden="true"><path d="M4 8h13a3 3 0 0 1 3 3M17 4l4 4-4 4M20 16H7a3 3 0 0 1-3-3M7 12l-4 4 4 4"/></svg>
                    <span>Trocas e devoluções</span>
                </a>
                {% if has_account_links %}
                    <a class="mu-account-link utilities-item" href="{{ store.customer_home_url | default(store.customer_login_url) }}" aria-label="Minha conta">
                        {% include "snipplets/svg/user.tpl" with {svg_custom_class: 'icon-inline utilities-icon'} %}
                    </a>
                {% endif %}
                <span class="js-cart-utility header-utility">
                    {% include "snipplets/header/header-utilities.tpl" %}
                </span>
            </div>
        </div>

        {# Add to cart notification #}

        {% if settings.ajax_cart %}
            {% if not settings.head_fix_desktop %}
                <div class="d-block d-md-none">
            {% endif %}
                    {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
            {% if not settings.head_fix_desktop %}
                </div>
            {% endif %}
        {% endif %}
        {# Desktop navigation below logo #}

        {% if true %}
            {# Desktop nav below logo #}
            <div class="row d-none d-md-block text-center">
                {% snipplet "navigation/navigation.tpl" %}
            </div>
        {% endif %}
        <nav class="tf-mobile-category-nav d-md-none" aria-label="{{ 'Categorias de roupas' | translate }}">
            <ul class="tf-mobile-categories">
                {% include 'snipplets/navigation/header-shopping-links.tpl' with {megamenu: false, hamburger: false} %}
            </ul>
        </nav>
    </div>    
    {% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{{ component('nubesdk-slot', { type: "after_header" }) }}

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add to cart notification for non fixed header #}

{% if settings.ajax_cart and not settings.head_fix_desktop %}
    <div class="d-none d-md-block">
        {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
    </div>
{% endif %}

{# Cross selling promotion notification on add to cart #}

{% embed "snipplets/modal.tpl" with {
    modal_id: 'js-cross-selling-modal',
    modal_class: 'bottom modal-bottom-sheet h-auto overflow-none modal-body-scrollable-auto',
    modal_header_title: true,
    modal_header_class: 'p-2 m-2 w-100',
    modal_position: 'bottom',
    modal_transition: 'slide',
    modal_footer: true,
    modal_width: 'centered-md m-0 p-0 modal-full-width modal-md-width-400px',
    modal_close_class: 'mr-3'
} %}
    {% block modal_head %}
        {{ '¡Descuento exclusivo!' | translate }}
    {% endblock %}

    {% block modal_body %}
        {# Promotion info and actions #}

        <div class="js-cross-selling-modal-body" style="display: none"></div>
    {% endblock %}
{% endembed %}

{% include "snipplets/header/header-modals.tpl" %}
