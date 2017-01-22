{% extends "app.volt" %}

{% block content %}
  <div class="section">

    <h1>
      {{ section.NAME }}
    </h1>

    <div class="section-sections">
      {% for b in tree.getChilds(section.ID) %}
        <div class="header-menu-item">
          {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
        </div>
      {% endfor %}
    </div>


    <div class="section-products">
      {% for product in products %}
        {{ link_to("catalog/" ~ product.ID, product.NAME) }}
        <br>
      {% endfor %}
    </div>

  </div>
{% endblock %}