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

      <div class="sizes">
        <div class="sizes-label">
          Размер / рост:
        </div>
        <div class="sizes-left">
          <div class="sizes-row">
            <div class="sizes-row-size">
              44-56 / 170-176
            </div>
            <div class="sizes-row-minus"></div>
            <div class="sizes-row-input"><input type="text" name=""></div>
            <div class="sizes-row-plus"></div>
          </div>
        </div>

        <div class="sizes-right">
        </div>
      </div>   
    </div>
  </div>
{% endblock %}





