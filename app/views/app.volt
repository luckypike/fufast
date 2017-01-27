<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    {{ get_title() }}

    {{ javascript_include('https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js', false) }}
    {{ javascript_include('https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js', false) }}

    {{ stylesheet_link('css/app.css') }}
    {{ javascript_include('js/fonts.js') }}
    {{ javascript_include('js/jquery.lazyload.min.js') }}
    {{ javascript_include('js/app.js') }}


    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>

  <body>
    {% include "header.volt" %}

    <main class="main">{% block content %}{% endblock %}</main>

    {% include "footer.volt" %}
  </body>
</html>