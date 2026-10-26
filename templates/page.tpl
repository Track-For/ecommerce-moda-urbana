{% set tf_privacy_page = (page.name | lower) == 'política de privacidade' %}
{% set tf_returns_page = (page.name | lower) == 'trocas e devoluções' %}
{% if tf_privacy_page or tf_returns_page %}<article class="tf-privacy-page tf-support-page{% if tf_returns_page %} tf-returns-page{% endif %}">
{% include 'snipplets/support-navigation.tpl' %}
{% endif %}
{% embed "snipplets/page-header.tpl" with {container: true} %}
	{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
{% endembed %}

{# Institutional page  #}

<section class="user-content pb-5">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				{{ page.content }}
			</div>
		</div>
	</div>
</section>
{% if tf_privacy_page or tf_returns_page %}
    <aside class="tf-privacy-contact">{% if tf_privacy_page %}Dúvidas sobre seus dados?{% else %}Precisa de ajuda com sua compra?{% endif %} <a href="/contato/">Entre em contato</a> ou <a href="mailto:fervalola51@gmail.com">envie um e-mail</a>.</aside>
</article>
{% endif %}
