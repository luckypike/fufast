{% extends "app.volt" %}

{% block content %}
  {% if section.DEPTH_LEVEL < 3 %}
    <div class="section-intro section-intro-root{{ tree.isRoot(section.ID) }} section-intro-{{ section.ID }}">
      <div class="text">
        <div class="title">
          {{ link_to('catalog/' ~ section.CODE|lower, section.NAME) }}
        </div>

        {% if section_childs|length %}
          <div class="siblings">
            {% for c in section_childs %}
              <div class="siblings-item">
                {{ link_to('catalog/' ~ c.CODE|lower, c.NAME) }}
              </div>
            {% endfor %}
          </div>
        {% endif %}
      </div>
    </div>
  {% else %}
    <div class="section-intro section-intro-{{ section.ID }}">
      <div class="text">
        <div class="title">
          {{ link_to('catalog/' ~ tree.getParents(section.ID)[1].CODE|lower, tree.getParents(section.ID)[1].NAME) }}
        </div>

        {% if tree.getSiblings(section.ID)|length %}
          <div class="siblings">
            {% for b in tree.getSiblings(section.ID) %}
              <div class="siblings-item">
                {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
              </div>
            {% endfor %}
          </div>
        {% endif %}
      </div>
    </div>
  {% endif %}

  <div class="section-filters">
    Фильтры
  </div>

  <div class="section">
    <div class="section-sections">
      {% for c in section_childs %}
        {% if c.PRODUCTS|length %}
          <div class="section-sections-item">
            <div class="section-sections-item-title">
              <h2>
                {{ link_to('catalog/' ~ c.CODE|lower, c.NAME) }}
              </h2>
            </div>

            {% if tree.getChilds(c.ID)|length %}
              <div class="section-sections-item-siblings siblings">
                {% for b in tree.getChilds(c.ID) %}
                  <div class="siblings-item">
                    {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
                  </div>
                {% endfor %}
              </div>
            {% endif %}

            <div class="section-sections-item-products">
              <div class="section-sections-item-products-main">
                <a href="{{ url('catalog/' ~ c.PRODUCT.ID) }}">
                  <div class="iandb">
                    <div class="image">
                      {{ image('/cover/' ~ c.PRODUCT.ID ~ '/ph.jpg', 'class': 'img ph') }}
                      {{ image('/cover/' ~ c.PRODUCT.ID ~ '/large.jpg', 'class': 'img lazy') }}
                    </div>
                    <div class="button">
                      Купить
                    </div>
                  </div>
                  <div class="tap">
                    <div class="title">
                      {{ c.PRODUCT.NAME }}
                    </div>
                    <div class="price">
                      999 руб.
                    </div>
                  </div>
                </a>
              </div>

              <div class="section-sections-item-products-list">
                <div class="products-list">
                  {% for product in c.PRODUCTS %}
                    <div class="products-list-item">
                      <a href="{{ url('catalog/' ~ product.ID) }}">
                        <div class="iandb">
                          <div class="image">
                            {{ image('/cover/' ~ product.ID ~ '/ph.jpg', 'class': 'img ph') }}
                            {{ image('/cover/' ~ product.ID ~ '/list.jpg', 'class': 'img lazy') }}
                          </div>
                          <div class="button">
                            Купить
                          </div>
                        </div>
                        <div class="tap">
                          <div class="title">
                            {{ product.NAME }}
                          </div>
                          <div class="price">
                            999 руб.
                          </div>
                        </div>
                      </a>
                    </div>
                  {% endfor %}
                  </div>
              </div>
            </div>

            <div class="section-sections-item-more">
              {{ link_to('catalog/' ~ c.CODE|lower, 'Посмотреть ещё', 'class': 'button') }}
            </div>
          </div>
        {% endif %}
      {% endfor %}
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
                  <div class="button">
                    Купить
                  </div>
                </div>
                <div class="tap">
                  <div class="title">
                    {{ product.NAME }}
                  </div>
                  <div class="price">
                    999 руб.
                  </div>
                </div>

              </a>
            </div>
          {% endfor %}
        </div>
      </div>
    {% endif %}
  </div>
{% endblock %}