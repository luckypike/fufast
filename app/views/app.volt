<!DOCTYPE html>
<html>
  <head>
    {% block head %}
     {{ stylesheet_link("css/app.css") }}
    {% endblock %}

    <title>{% block title %}{% endblock %} - FUFAST</title>
  </head>

  <body>
    {% include "header.volt" %}

    <main class="main">{% block content %}{% endblock %}</main>

    {% include "footer.volt" %}
  </body>
</html>