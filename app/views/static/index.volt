{% extends "app.volt" %}

{% block content %}
  {{ javascript_include('js/slick.min.js') }}

  <div class="page-index">
    <div class="page-index-main-slider">
      <div class="plh"></div>
      <div class="slider">
        <div class="slide slide-1">
          <div class="text">
            Делаем тяжёлую работу комфортной
          </div>
        </div>

        <div class="slide slide-2">
          <div class="text">
            Мы с вами в&nbsp;любом деле
          </div>
        </div>

        <div class="slide slide-3">
          <div class="text">
            Пройдём сквозь огонь, воду и&nbsp;медные трубы
          </div>
        </div>

        <div class="slide slide-4">
          <div class="text">
            Ежедневная защита для&nbsp;настоящих героев
          </div>
        </div>

        <div class="slide slide-5">
          <div class="text">
            Доставим в&nbsp;любую точку мира
          </div>
        </div>
      </div>
    </div>

    {% for pos, section in sections %}
      <section class="page-index-section {% if pos is even %} page-index-section-invert{% endif %} section-s{{ pos + 1 }}">
        <div class="page-index-section-image image-s{{ pos + 1 }}">
          <div class="img"></div>
          <div class="text">
            <h1>{{ section['section']['title'] }}</h1>
            <div class="action">
              {{ link_to('catalog/' ~ section['section']['url']|lower, section['section']['button'], 'class': 'button') }}

            </div>
          </div>
        </div>

        <div class="page-index-section-goods goods-s{{ pos + 1 }} goods">
          {% for products in section['goods'] %}
            <div class="goods-slide"><div class="products-list">
              {% for product in products %}
                <div class="products-list-item">
                  <a href="{{ url('catalog/' ~ product['ID']) }}">
                    <div class="iandb">
                      <div class="image">
                        {{ image('/cover/title/' ~ product['ID'] ~ '/ph.jpg', 'class': 'img ph') }}
                        {{ image('/cover/title/' ~ product['ID'] ~ '/list.jpg', 'class': 'img lazy') }}
                      </div>
                      <div class="buy">
                        Выбрать
                      </div>
                    </div>
                    <div class="tap">
                      <div class="title">
                        {{ product['NAME'] }}
                      </div>
                      <div class="price">
                        {{ money(product['PRICE'], 0, ',', ' ') }} ₽
                      </div>
                    </div>
                  </a>
                </div>
              {% endfor %}
            </div></div>
          {% endfor %}
        </div>
      </section>
    {% endfor %}

    <section class="index-section section-s5  page-index-section page-index-section-s5">
      <div class="bg"></div>
      <div class="man">

      </div>
      <div class="logos">
        <div class="logos-item logos-item-1"></div>
        <div class="logos-item logos-item-2"></div>
        <div class="logos-item logos-item-3"></div>
        <div class="logos-item logos-item-4"></div>
        <div class="logos-item logos-item-5"></div>
      </div>

      <div class="logos-mini">
        <div class="logos-mini-item logos-mini-item-1 active" rel="0"></div>
        <div class="logos-mini-item logos-mini-item-2" rel="1"></div>
        <div class="logos-mini-item logos-mini-item-3" rel="2"></div>
        <div class="logos-mini-item logos-mini-item-4" rel="3"></div>
        <div class="logos-mini-item logos-mini-item-5" rel="4"></div>
      </div>

      <div class="text">
        <h1>
          Нанесение логотипов
        </h1>
        <div class="action">
          <a href="/logo" class="button"><span class="more">Подробнее</span><span class="title">Нанесение логотипов</span></a>

        </div>
      </div>
    </section>
  </div>
{% endblock %}


