<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    {{ get_title() }}
    {{ metatag.getMeta() }}

    {{ javascript_include('https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js', false) }}

    {{ stylesheet_link('css/app.css?v=' ~ config.site.version) }}
    {{ javascript_include('https://use.typekit.net/eua0zbv.js', false) }}
    {{ javascript_include('js/jquery.lazyload.min.js') }}
    {{ javascript_include('js/js.cookie.js') }}
    {{ javascript_include('js/app.js?v=' ~ config.site.version) }}

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
  </head>

  <body>
    {% include "header.volt" %}

    <main class="main">{% block content %}{% endblock %}</main>

    {% include "footer.volt" %}
  </body>
</html>