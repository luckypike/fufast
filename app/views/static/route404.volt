{% extends "app.volt" %}

{% block content %}
  <div class="section-intro-wrapper section-intro-wrapper-root1">
    <div class="section-intro section-intro-404">
    </div>
  </div>

  <div class="page-static page-content page-404">
    <h1>
      Ошибка 404: страница не сущесвует
    </h1>
    <p>
      По текущей ссылке не найдено ни одной страницы. Мы обновлем сайт, поэтому изредка могут возникать небольшие проблемы.
    </p>
    <p>
      Выберите нужный раздел:
    </p>
    <ul>
      {% for b in tree.getMenu() %}
        <li>
          {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
        </li>
      {% endfor %}
    </ul>
    <p>
      Приносим извинения за доставленные неудобства. Спасибо.
    </p>
  </div>
{% endblock %}