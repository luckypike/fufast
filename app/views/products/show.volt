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
                <div class="slider-images-item" style="background-image: url('{{ '/upload/' ~ image['SUBDIR'] ~ '/' ~ image['FILE_NAME'] }}')">
                </div>
              {% endfor %}
            </div>
          </div>
        </div>


        {% if images|length > 1 %}
          <div class="thumbs" id="bx-pager">
            {% for image in images %}
              <a data-slide-index="{{ loop.index0 }}" href="">
                <div class="thumbs-item" style="background-image: url('{{ '/upload/' ~ image['SUBDIR'] ~ '/' ~ image['FILE_NAME'] }}')"></div>
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
          {{ product.DETAIL_TEXT }}
        </div>
      </div>

      {% if images|length %}
        <div class="prop">
          {% for prop in props %}
            <div class="prop-row">
              <div class="prop-label">
              {{ prop['NAME'] }}
              </div>
              <div class="prop-value">
                {% if prop['PROPERTY_TYPE'] == 'S' %}
                  {{ props_elem[prop['ID']][0] }}
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
          {% endfor %}
        </div>
      {% endif %}

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
                <div class="sizes-row-input"><input type="text" name="" placeholder="0" data-number="{{ o[1] }}" data-size="{{ o[0]['size'] }}" data-height="{{ o[0]['height'] }}"></div>
                <div class="sizes-row-plus"></div>
              </div>
            {% endfor %}

            </div>
          {% endfor %}
        </div>
      {% endif %}

      <div class="order">
        <div class="order-price">
          Цена за штуку
          <div class="price">
            {{ money(product.PRICE, 0, ',', ' ') }} руб.
          </div>
        </div>

        <div class="order-to-basket">
          <button class="button" data-size="false" data-id="{{ product.ID }}">В корзину</button>
        </div>
      </div>
    </div>
  </div>
{% endblock %}





