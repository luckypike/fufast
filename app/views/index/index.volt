{% for product in products %}
  {{ product.ID }} — {{ product.NAME }}
  <br>
{% endfor %}
