{% extends "app.volt" %}

{% block content %}
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
        {% for image in images %}
          <div class="product-images-item">
            {{ image('/upload/' ~ image['SUBDIR'] ~ '/' ~ image['FILE_NAME']) }}
          </div>
        {% endfor %}    
      </div>
    {% endif %}

    <div class="product-details">
      <h1>
        {{ product.NAME }} -- {{ product.ID }}
      </h1>

      <div class="desc">
        <div class="desc-cat">
        </div>

        <div class="desc-product">
          {{ product.DETAIL_TEXT }}
        </div>
      </div>     
    </div>
  </div>
{% endblock %}





