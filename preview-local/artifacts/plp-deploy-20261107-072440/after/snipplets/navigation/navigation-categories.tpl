<div class="nav-categories">
	<ul class="nav-list-mobile-categories">
		{% for category in categories %}
{% if 'masculin' not in (category.name | lower) and 'masculin' not in (category.url | lower) and 'cueca' not in (category.name | lower) and 'cueca' not in (category.url | lower) %}
			<li class="nav-item">
				<a class="{% if megamenu %}nav-link-category{% else %}nav-list-link {{ item.current ? 'selected' : '' }}{% endif %}" href="{{ category.url | replace('modaurbanaoutlet.com.br', 'modaurbanaoficial.com.br') }}">{{ category.name }}</a>
			</li>
		{% endif %}
{% endfor %}
	</ul>
</div>
