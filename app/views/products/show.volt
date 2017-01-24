{% extends "app.volt" %}

{% block content %}
  {{ javascript_include('js/jquery.bxslider.min.js') }}

  <div class="product">
    {% if sections|length %}
      <div class="product-sections">
        <div class="product-sections-root">
          {{ tree.getParents(section.ID)[1].NAME }}
        </div>

        {% if tree.getSiblings(section.ID)|length %}
          <div class="product-sections-siblings siblings">
            {% for b in tree.getSiblings(section.ID) %}
              <div class="siblings-item">
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
                <div class="slider-images-item" style="background-image: url('{{ '/upload/' ~ image['SUBDIR'] ~ '/' ~ image['FILE_NAME'] }}')">
                </div>
              {% endfor %}                
            </div>
          </div>
        </div>

        <div class="thumbs" id="bx-pager">
          {% for image in images %}
            <a data-slide-index="{{ loop.index0 }}" href="">
              <div class="thumbs-item" style="background-image: url('{{ '/upload/' ~ image['SUBDIR'] ~ '/' ~ image['FILE_NAME'] }}')"></div>
            </a>
          {% endfor %}         
        </div>
      </div>
    {% endif %}

    <div class="product-details">
      <h1>
        {{ product.NAME }}
      </h1>

      <div class="desc">
        <div class="desc-cat">
        </div>

        <div class="desc-product">
          {{ product.DETAIL_TEXT }}
        </div>
      </div>

      <div class="prop">
        <div class="prop-row">
          <div class="prop-label">Артикул</div>
          <div class="prop-value">054044AC</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">Ассортимент</div>
          <div class="prop-value">Куртка</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">Состав</div>
          <div class="prop-value">Полиэстер, 35% хлопок, плотность 245 г/м2</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">Защитные свойства</div>
          <div class="prop-value">От истирания, от общих загрязнений</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">ГОСТ</div>
          <div class="prop-value">27575-87</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">Вес за 1 ед.</div>
          <div class="prop-value">1.63 кг</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">Объем за 1 ед.</div>
          <div class="prop-value">0.048 м3</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">Кол-во товара в упаковке</div>
          <div class="prop-value">5 шт.</div>
        </div>
        <div class="prop-row">
          <div class="prop-label">Объем 1 упаковки</div>
          <div class="prop-value">0.048 м3</div>
        </div>
      </div>

      <div class="sizes">
        <div class="sizes-label">
          Размер / рост:
        </div>
        <div class="sizes-left">
          <div class="sizes-row">
            <div class="sizes-row-size">
              44-46 / 170-176
            </div>
            <div class="sizes-row-minus"></div>
            <div class="sizes-row-input"><input type="text" name="" value="0"></div>
            <div class="sizes-row-plus"></div>
          </div>

          <div class="sizes-row">
            <div class="sizes-row-size">
              44-46 / 182-188
            </div>
            <div class="sizes-row-minus"></div>
            <div class="sizes-row-input"><input type="text" name="" value="0"></div>
            <div class="sizes-row-plus"></div>
          </div>

        </div>

        <div class="sizes-right">

          <div class="sizes-row">
            <div class="sizes-row-size">
              48-50 / 170-176
            </div>
            <div class="sizes-row-minus"></div>
            <div class="sizes-row-input"><input type="text" name="" value="0"></div>
            <div class="sizes-row-plus"></div>
          </div>

          <div class="sizes-row">
            <div class="sizes-row-size">
              48-50 / 182-188
            </div>
            <div class="sizes-row-minus"></div>
            <div class="sizes-row-input"><input type="text" name="" value="0"></div>
            <div class="sizes-row-plus"></div>
          </div>


        </div>
      </div>

      <div class="order">
        <div class="order-price">
          Общая стоимость
          <div class="price">
            384 000 руб.
          </div>
        </div>

        <div class="order-to-basket">
          <a href="#" class="button">В корзину</a>
        </div>
      </div>   
    </div>
  </div>
{% endblock %}





