{# Contact destinations confirmed by Moda Urbana Outlet. #}
{% set tf_whatsapp = 'https://wa.me/5519989794848' %}
{% set tf_phone = '+5519989794848' %}
{% set tf_email = 'fervalola51@gmail.com' %}
<ul class="contact-info">
	{% if tf_whatsapp %}
		<li class="footer-menu-item">
			<a href="{{ tf_whatsapp }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ tf_whatsapp |trim('https://wa.me/') }}
			</a>
		</li>
	{% endif %}
	{% if tf_phone %}
		<li class="footer-menu-item">
			<a href="tel:{{ tf_phone }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ tf_phone }}
			</a>
		</li>
	{% endif %}
	{% if tf_email %}
		<li class="footer-menu-item">
			<a href="mailto:{{ tf_email }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
				{% if with_icons %}
					{% include "snipplets/svg/email.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ tf_email }}
			</a>
		</li>
	{% endif %}
	{% if not phone_and_mail_only %}
		{% if store.address and not is_order_cancellation %}
			<li class="footer-menu-item">
				{% if with_icons %}
					{% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
				{% endif %}
				{{ store.address }}
			</li>
		{% endif %}
		{% if store.blog %}
			<li class="footer-menu-item">
				<a target="_blank" href="{{ store.blog }}" class="{% if btn_link %}btn{% else %}contact{% endif %}-link">
					{% if with_icons %}
						{% include "snipplets/svg/comments.tpl" with {svg_custom_class: "icon-inline mr-1 font-body"} %}
					{% endif %}
					{{ "¡Visitá nuestro Blog!" | translate }}
				</a>
			</li>
		{% endif %}
	{% endif %}
</ul>
