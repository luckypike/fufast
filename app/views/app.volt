<!DOCTYPE html>
<html>
  <head>
    {% block head %}
      {{ javascript_include('https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js', false) }}
      {{ javascript_include('https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js', false) }}
      
      {{ stylesheet_link('css/app.css') }}
      {{ javascript_include('js/fonts.js') }}
      {{ javascript_include('js/app.js') }}
    {% endblock %}

    {{ get_title() }}
  </head>

  <body>
    {% include "header.volt" %}

    <main class="main">{% block content %}{% endblock %}</main>

    {% include "footer.volt" %}
  </body>
</html>