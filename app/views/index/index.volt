{% extends "app.volt" %}

{% block content %}

  {% for product in products %}
    {{ link_to("catalog/" ~ product.ID, product.NAME) }}
    <br>
  {% endfor %}
    
{% endblock %}


