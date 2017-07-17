{% extends "app.volt" %}

{% block content %}
  {{ javascript_include('js/jquery.bxslider.min.js') }}

  <div class="product page-content">
    {% if sections|length %}
      <div class="product-sections">
        <div class="product-sections-root">
          {{ tree.getParents(section.ID)[1].NAME }}
        </div>

        {% if tree.getSiblings(section.ID)|length %}
          <div class="product-sections-siblings siblings">
            {% for b in tree.getSiblings(section.ID) %}
              <div class="siblings-item{% if section.ID == b.ID %} active{% endif %}">
                {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
              </div>
            {% endfor %}
          </div>
        {% endif %}

        <div class="product-sections-breadcrumb breadcrumb">
          <div class="breadcrumb-item">
            {{ link_to('/', 'Главная') }}
          </div>

          {% for b in tree.getParents(section.ID) %}
            <div class="breadcrumb-item">
              {{ link_to('catalog/' ~ b.CODE|lower , b.NAME) }}
            </div>
          {% endfor %}
        </div>
      </div>
    {% endif %}

    {% if images|length %}
      <div class="product-images">
        <div class="slider">
          <div class="slider-wrapper">
            <div class="slider-images bxslider">
              {% for image in images %}
                <div class="slider-images-item" style="background-image: url('/cover/images/{{ image['ID'] }}/large.jpg')">
                </div>
              {% endfor %}
            </div>
          </div>
        </div>


        {% if images|length > 1 %}
          <div class="thumbs" id="bx-pager">
            {% for image in images %}
              <a data-slide-index="{{ loop.index0 }}" href="">
                {{ image('/cover/images/' ~ image['ID'] ~ '/small.jpg', 'class': 'img thumbs-item') }}
                <!-- <div class="thumbs-item" style="background-image: url('{{ '/upload/' ~ image['SUBDIR'] ~ '/' ~ image['FILE_NAME'] }}')"></div> -->
              </a>
            {% endfor %}
          </div>
        {% endif %}
      </div>
    {% endif %}

    <div class="product-details">
      <h1>
        {{ product.NAME }}
      </h1>

      <div class="desc">
        <div class="desc-product">
          {{ product.DETAIL_TEXT_HTML }}
        </div>
      </div>

      <div class="prop">
        {% for prop in props %}
          <div class="prop-row prop-row-{{ prop['ID'] }}">
            <div class="prop-label">
            {{ prop['NAME'] }}
            </div>
            <div class="prop-value">
              <div class="vl">
                {% if prop['PROPERTY_TYPE'] == 'S' %}
                  {{ props_elem[prop['ID']][0] }}
                  {% if prop['SUFFIX'] is not empty %}
                    {{ prop['SUFFIX'] }}
                  {% endif %}
                {% else %}
                  {% for v in props_elem[prop['ID']] %}
                    {{ props_elem_enum[prop['ID']][int(v)] }}
                    {% if !loop.last %}
                      /
                    {% endif %}
                  {% endfor %}
                {% endif %}
              </div>
            </div>
            {% if int(prop['ID']) == 153 %}
              <div class="prop-desc">
                <table class="en">
                  <tr class="h">
                    <td class="l z"></td>
                    <td>0</td>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                  </tr>

                  <tr>
                    <td class="l">A</td>
                    <td>&lt;&nbsp;100</td>
                    <td>100</td>
                    <td>500</td>
                    <td>2000</td>
                    <td>8000</td>
                    <td>—</td>
                  </tr>

                  <tr>
                    <td class="l">B</td>
                    <td>&lt;&nbsp;1,2</td>
                    <td>1,2</td>
                    <td>2,5</td>
                    <td>5,0</td>
                    <td>10,0</td>
                    <td>20,0</td>
                  </tr>

                  <tr>
                    <td class="l">C</td>
                    <td>&lt;&nbsp;10</td>
                    <td>10</td>
                    <td>25</td>
                    <td>50</td>
                    <td>75</td>
                    <td>—</td>
                  </tr>

                  <tr>
                    <td class="l">D</td>
                    <td>&lt;&nbsp;20</td>
                    <td>20</td>
                    <td>60</td>
                    <td>100</td>
                    <td>150</td>
                    <td>—</td>
                  </tr>
                </table>

                <p>
                  По нормам EN388 оценивается механическая прочность перчаток по четырем показателям:
                  <br>
                  <ul>
                    <li>A: прочность на истирание в количестве циклов;</li>
                    <li>B: индекс прочности на разрез;</li>
                    <li>C: сила в ньютонах требуемая для разрыва;</li>
                    <li>D: сила в ньютонах требуемая для прокола .</li>
                  </ul>
                </p>

              </div>
            {% endif %}
          </div>
        {% endfor %}
        <div class="prop-row">
          <div class="prop-label">
            {% if tree.getParents(section.ID)[0].ID == 168 %}
              Цена за пару
            {% else %}
              Цена за штуку
            {% endif %}
          </div>
          <div class="prop-value">
            {{ money(product.PRICE, 0, ',', ' ') }} ₽
          </div>
        </div>
      </div>


      {% if size %}
        <div class="sizes">
          <div class="sizes-label">
            Размер
            {% if height %}
            / рост
            {% endif %}
          </div>

          {% for c in order %}
            {% if loop.first %}
              <div class="sizes-left">
            {% endif %}

            {% if loop.last %}
              <div class="sizes-right">
            {% endif %}

            {% for o in c %}
              <div class="sizes-row">
                <div class="sizes-row-size">
                  {{ o[1] }}
                </div>
                <div class="sizes-row-minus"></div>
                <div class="sizes-row-input"><input type="text" name="" placeholder="0" data-number="{{ o[1] }}" data-size="{{ o[0]['size'] }}" {% if height %}data-height="{{ o[0]['height'] }}" {% endif %}></div>
                <div class="sizes-row-plus"></div>
              </div>
            {% endfor %}
            </div>
          {% endfor %}
          <div class="sizes-clear">
            <span>Х Очистить выбор</span>
          </div>
        </div>
      {% else %}
        <div class="sizes">
          <div class="sizes-left">
            <div class="sizes-row">
              <div class="sizes-row-size">
                Количество
              </div>
              <div class="sizes-row-minus"></div>
              <div class="sizes-row-input"><input type="text" name="" placeholder="0" data-assort="yes" value="1"></div>
              <div class="sizes-row-plus"></div>
            </div>
          </div>
          <div class="sizes-clear">
            <span>Х Очистить выбор</span>
          </div>
        </div>
      {% endif %}

      <div class="order">
        <div class="order-price">
          <div class="ppi">
            {% if tree.getParents(section.ID)[0].ID == 168 %}
              Цена за пару
            {% else %}
              Цена за штуку
            {% endif %}
          </div>
          <div class="po">Общая стоимость</div>
          <div class="price" data-price="{{ product.PRICE }}" data-price-human="{{ money(product.PRICE) }}">
            {{ money(product.PRICE) }} ₽
          </div>
        </div>

        <div class="order-to-basket">
          <button class="button" data-size="false" data-id="{{ product.ID }}">В корзину</button>
        </div>
      </div>

      <div class="msg">
      </div>
    </div>

    {% for product in same.getAssoc(same.getSections(tree.getParents(section.ID)[0].ID)) %}
      {% if loop.first %}
        <div class="product-assoc">
          <div class="product-assoc-title">
            С этим товаром покупают
          </div>
          <div class="products-list">
      {% endif %}

      <div class="products-list-item">
        <a href="{{ url('catalog/' ~ product.ID) }}">
          <div class="iandb">
            <div class="image">
              {{ image('/cover/title/' ~ product.ID ~ '/ph.jpg', 'class': 'img ph') }}
              {{ image('/cover/title/' ~ product.ID ~ '/list.jpg', 'class': 'img lazy') }}
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
              {{ money(product.PRICE) }} ₽
            </div>
          </div>

        </a>
      </div>

      {% if loop.last %}
          </div>
        </div>
      {% endif %}
    {% endfor %}
  </div>
{% endblock %}





