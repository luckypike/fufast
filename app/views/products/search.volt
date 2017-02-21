{% extends "app.volt" %}

{% block content %}
  <div class="page-search">
    <h1>
      Поиск
    </h1>

    <div class="search-form">
      <form action="{{ url('search') }}">
        <input class="search-form-input" type="text" name="q" value="{{ query }}">
        <input class="search-form-submit button" type="submit" value="Найти">
      </form>

    </div>

    {% if products|length %}
      <div class="section-products">
        <div class="products-list">
          {% for product in products %}
            <div class="products-list-item">
              <a href="{{ url('catalog/' ~ product.ID) }}">
                <div class="iandb">
                  <div class="image">
                    {{ image('/cover/' ~ product.ID ~ '/ph.jpg', 'class': 'img ph') }}
                    {{ image('/cover/' ~ product.ID ~ '/list.jpg', 'class': 'img lazy') }}
                  </div>
                  <div class="buy">
                    Выбрать
                  </div>
                </div>
                <div class="tap">
                  <div class="title">
                    {{ product.NAME }}
                  </div>
                  <div class="price">
                    {{ money(product.PRICE, 0, ',', ' ') }} руб.
                  </div>
                </div>

              </a>
            </div>
          {% endfor %}
        </div>
      </div>
    {% elseif query %}
      <p>
        По этому запросу ничего не найдено.
      </p>
    {% endif %}
  </div>
{% endblock %}