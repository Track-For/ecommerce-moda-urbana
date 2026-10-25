{% if store.whatsapp %}
    <a href="https://wa.me/5519989794848" target="_blank" rel="noopener" class="js-btn-fixed-bottom btn-whatsapp" aria-label="{{ 'Comunicate por WhatsApp' | translate }}">
        {% include "snipplets/svg/whatsapp.tpl" with {'chat' : true} %}
    </a>
{% endif %}
