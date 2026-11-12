<aside class="mu-commerce-trust" aria-label="Segurança e pagamento">
    <div class="mu-trust-message">
        {% include 'snipplets/svg/security.tpl' with {svg_custom_class: 'mu-trust-icon'} %}
        <div><strong>Conexão segura SSL</strong><span>Seus dados são transmitidos com criptografia HTTPS.</span></div>
    </div>
    {% if settings.payments %}
        <div class="mu-trust-payments"><strong>Formas de pagamento</strong><div>{% include 'snipplets/logos-icons.tpl' with {payments: true, shipping: false} %}</div><small>Confira as opções e condições disponíveis para seu pedido na finalização.</small></div>
    {% endif %}
    <div class="mu-trust-links"><a href="/politica-de-privacidade/">Privacidade dos seus dados</a><a href="/trocas-e-devolucoes/">Trocas e devoluções</a></div>
</aside>
