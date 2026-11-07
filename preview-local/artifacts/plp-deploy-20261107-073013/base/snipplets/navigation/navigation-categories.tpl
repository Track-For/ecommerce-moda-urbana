<div class="nav-categories">
	<ul class="nav-list-mobile-categories">
		{% for category in categories %}
			<li class="nav-item">
				<a class="{% if megamenu %}nav-link-category{% else %}nav-list-link {{ item.current ? 'selected' : '' }}{% endif %}" href="{{ category.url | replace('modaurbanaoutlet.com.br', 'modaurbanaoficial.com.br') }}">{{ category.name }}</a>
			</li>
		{% endfor %}
	</ul>
</div>
