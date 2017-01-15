{% extends "app.volt" %}

{% block content %}
  <div class="product">
    {% if sections|length %}
      {{ dump(section['ID']) }}
      <div class="product-sections">
        <div class="product-sections-root">
          {{ tree.getParents(section['ID'])[1]['NAME'] }}
        </div>

        <div class="product-sections-siblings">

        </div>

        <div class="product-sections-breadcrumb breadcrumb">
          <div class="breadcrumb-item">
            {{ link_to('', 'Главная') }}
          </div>

          {% for b in tree.getParents(section['ID']) %}
            <div class="breadcrumb-item">
              {{ link_to('', b['NAME']) }}
            </div>
          {% endfor %}

<!--           <div class="breadcrumb-item">
            {{ link_to('', tree.getName(section['ID'])) }}
          </div> -->
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
  </div>

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
{% endblock %}





