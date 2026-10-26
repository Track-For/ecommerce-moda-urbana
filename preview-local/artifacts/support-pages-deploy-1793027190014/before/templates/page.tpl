{% set tf_privacy_page = (page.name | lower) == 'política de privacidade' %}
{% if tf_privacy_page %}<article class="tf-privacy-page">{% endif %}
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
{% if tf_privacy_page %}
    <aside class="tf-privacy-contact">Dúvidas sobre seus dados? <a href="mailto:fervalola51@gmail.com">Fale conosco por e-mail</a>.</aside>
</article>
{% endif %}
