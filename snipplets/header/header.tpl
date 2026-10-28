{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{# Header #}
{# Compact brand header; native utility handlers and destinations are retained. #}
{% set tf_compact_header = true %}

{# Logo mobile dynamic classes #}

{% if 'center' == 'center' %}
    {% set logo_mobile_classes = 'text-center' %}
{% else %}
    {% set logo_mobile_classes = 'order-first text-left' %}
{% endif %}

{# Logo desktop dynamic classes + utilities desktop order #}

{% if 'center' == 'center' %}
    {% set logo_desktop_classes = 'head-logo-md-center order-md-0 text-md-center' %}
    {% set menu_desktop_utility_order_class = 'order-md-first' %}
{% else %}
    {% set logo_desktop_classes = 'head-logo-md-left order-md-first text-md-left' %}
    {% set menu_desktop_utility_order_class = 'order-md-last' %}
{% endif %}

{# Utilities mobile order #}

{% if 'center' == 'center' %}
    {% set menu_mobile_utility_order_class = 'order-first' %}
{% else %}
    {% set menu_mobile_utility_order_class = 'order-last' %}
{% endif %}

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

{% set logo_centered_desktop_without_hamburger = not false and 'center' == 'center' %}
{% set show_desktop_hide_mobile_class = 'd-none d-md-inline-block' %}

{% set has_languages = languages | length > 1 and settings.languages_header %}
{% set head_languages_centered_with_big_logo = has_languages and 'center' == 'center' and settings.logo_size != 'small' %}

{% set has_account_links = settings.account_header %}

<header class="tf-header js-head-main {% if head_transparent %}js-head-mutator{% endif %} {% if head_transparent_type_always %}head-transparent{% endif %} {% if head_transparent_type_on_section_above_the_fold %}head-transparent-on-section{% endif %} {% if head_transparent and settings.head_transparent_contrast_options %}head-transparent-contrast{% endif %} head-main {{ head_position_mobile }} {{ head_position_desktop }} transition-soft" data-store="head">
    <div class="tf-shipping-announcement">Frete Grátis para o estado de São Paulo</div>
    {# Adversiting bar #}
    {% if settings.ad_bar %}
        {% snipplet "header/header-advertising.tpl" %}
    {% endif %}
    <div class="container-fluid">
        <div class="{% if not settings.head_fix_desktop %}js-nav-logo-bar{% endif %} row no-gutters align-items-center">

            {# Menu icon #}
            
            {% if logo_centered_desktop_without_hamburger %}
                <div class="{% if 'center' == 'left' %}col-auto{% else %}col-3{% endif %} {% if 'center' == 'left' %}col-md-auto{% else %}col-md-3{% endif %} {{ menu_mobile_utility_order_class }} {{ menu_desktop_utility_order_class }}">

                    {# Search for desktop when logo centered without hamburger nav #}

                    <span class="js-search-utility header-utility d-none d-md-block">
                        {% include "snipplets/header/header-utilities.tpl" with {use_search: true} %}
                    </span>
            {% endif %}
                    <div class="{% if 'center' == 'left' %}col-auto{% else %}col-3{% endif %} {% if 'center' == 'left' %}col-md-auto{% else %}col-md-3{% endif %} header-utility {{ menu_mobile_utility_order_class }} {{ menu_desktop_utility_order_class }} {% if false %}d-md-block{% else %}d-md-none{% endif %} p-0">
                        {% include "snipplets/header/header-utilities.tpl" with {use_menu: true} %}
                    </div>
            {% if logo_centered_desktop_without_hamburger %}
                </div>
            {% endif %}

            {# Logo #}

            <div class="js-logo-col {% if 'center' == 'left' or ('center' == 'center' and 'icon' == 'text') %}col{% else %}{% if head_languages_centered_with_big_logo %}col-5{% else %}col-6{% endif %}{% endif %} {% if 'center' == 'left' %}{% if false %}col-md{% else %}col-md-auto{% endif %}{% else %}col-md-6{% endif %} {{ logo_mobile_classes }} {{ logo_desktop_classes }}">
                {% include "snipplets/header/header-logo.tpl" %}
            </div>

            {# Desktop navigation next to logo #}

            {% if not false and 'center' == 'left' %}
                {# Desktop nav next logo #}
                <div class="js-desktop-nav-col desktop-nav-col col {{ show_desktop_hide_mobile_class }} pr-5 pl-3">
                    {% snipplet "navigation/navigation.tpl" %}
                </div>
            {% endif %}

            {# Search: Icon or box #}

            <div class="tf-header-actions {% if not false and 'center' == 'left' %}js-desktop-search-cart-col desktop-search-cart-col{% endif %} {% if 'center' == 'left' %}col-auto{% else %}{% if 'icon' == 'text' %}{% if has_languages %}col-5{% else %}col-4{% endif %}{% else %}{% if head_languages_centered_with_big_logo %}col-4{% else %}col-3{% endif %}{% endif %}{% endif %} {% if 'center' == 'left' %}col-md-auto{% else %}col-md-3{% endif %} d-flex align-items-center justify-content-end">
                
                {# Languages #}

                {% if has_languages %}
                    <div class="header-utility">
                        {% include "snipplets/header/header-utilities.tpl" with {use_languages: true} %}
                    </div>
                {% endif %}

                {# Account #}

                {% if has_account_links %}
                    <div class="header-utility d-none d-md-inline-block">
                        {% include "snipplets/header/header-utilities.tpl" with {use_account: true, header: true} %}
                    </div>
                {% endif %}

                {# Search #}

                <span class="js-search-utility header-utility {% if logo_centered_desktop_without_hamburger %}d-md-none{% elseif 'search_icon' != 'search_icon' or 'icon' == 'text' %}{{ show_desktop_hide_mobile_class }}{% endif %} {% if has_languages or has_account_links %}{% if settings.search_big_desktop %}order-md-first{% else %}order-md-0{% endif %}{% endif %}">
                    {% include "snipplets/header/header-utilities.tpl" with {use_search: true} %}
                </span>

                {# Cart/Bag #}

                <span class="js-cart-utility header-utility {% if 'center' == 'center' and 'icon' == 'text' %}text-right{% endif %}">
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

        {% if not false and 'center' != 'left' %}
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
