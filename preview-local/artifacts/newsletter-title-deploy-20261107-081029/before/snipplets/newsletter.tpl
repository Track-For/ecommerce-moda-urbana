{% if settings.news_show %}
    <div class="js-newsletter newsletter tf-footer-newsletter">
        <div class="tf-newsletter-intro">
            {% if settings.news_title %}<h2>{{ settings.news_title }}</h2>{% endif %}
        </div>
        <div class="tf-newsletter-fields">
            <form method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
                {% include 'snipplets/forms/privacy-check.tpl' with {privacy_marketing: true} %}
                <div class="tf-newsletter-form">
                    <input class="form-control" id="footer-news-name" type="text" name="name" autocomplete="name" placeholder="{{ 'Seu nome (opcional)' | translate }}" aria-label="{{ 'Seu nome (opcional)' | translate }}">
                    <input class="form-control" id="footer-news-email" type="email" name="email" autocomplete="email" required placeholder="{{ 'Seu e-mail' | translate }}" aria-label="{{ 'Seu e-mail' | translate }}">
                    <input class="form-control" id="footer-news-phone" type="tel" name="phone" autocomplete="tel" placeholder="{{ 'WhatsApp (opcional)' | translate }}" aria-label="{{ 'WhatsApp (opcional)' | translate }}">
                    <div class="winnie-pooh" style="display: none;">
                        <label for="footer-news-honeypot">{{ 'No completar este campo' | translate }}</label>
                        <input id="footer-news-honeypot" type="text" name="winnie-pooh" tabindex="-1" autocomplete="off">
                    </div>
                    <input type="hidden" name="message" value="{{ 'Pedido de inscripción a newsletter' | translate }}">
                    <input type="hidden" name="type" value="newsletter">
                    <input type="submit" name="contact" class="btn btn-secondary tf-newsletter-submit" value="{{ 'Enviar' | translate }}">
                </div>
            </form>
            {% if contact and contact.type == 'newsletter' %}
                {% if contact.success %}
                    <div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
                {% else %}
                    <div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
                {% endif %}
            {% endif %}

        </div>
    </div>
{% endif %}
