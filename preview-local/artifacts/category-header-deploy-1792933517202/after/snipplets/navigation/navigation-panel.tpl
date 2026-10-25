{% if primary_links %}
    <div class="nav-primary">
        <ul class="nav-list" data-store="navigation" data-component="menu">
            {% include 'snipplets/navigation/header-shopping-links.tpl' with { 'hamburger' : true  } %}
        </ul>
    </div>
{% else %}
    <div class="nav-secondary text-left text-md-right" data-store="account-links">
        {% include "snipplets/header/header-utilities.tpl" with {use_account: true} %}
    </div>
{% endif %}
