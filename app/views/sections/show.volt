{% extends "app.volt" %}

{% block content %}
  {% if section.DEPTH_LEVEL < 3 %}
    <div class="section-intro-wrapper section-intro-wrapper-root{{ tree.isRoot(section.ID) }}">
      <div class="section-intro section-intro-{{ section.ID }}">
      </div>
      <div class="section-intro-text">
        <div class="title">
          {{ link_to('catalog/' ~ section.CODE|lower, section.NAME) }}
        </div>

        <div class="sibfil-placeholder"></div>

        <div class="sibfil">
          {% if section_childs|length %}
            <div class="siblings">
              <div class="siblings-title">
                Все подразделы
              </div>
              {% for c in section_childs %}
                <div class="siblings-item">
                  {{ link_to('catalog/' ~ c.CODE|lower, c.NAME_SHORT) }}
                </div>
              {% endfor %}
            </div>
          {% endif %}

          <div class="section-intro-filters">
            Фильтры
          </div>
        </div>
      </div>
    </div>
  {% else %}

    <div class="section-intro-wrapper section-intro-wrapper-root">
      <div class="section-intro section-intro-{{ section.ID }}">
      </div>
      <div class="section-intro-text">
        <div class="title">
          {{ link_to('catalog/' ~ tree.getParents(section.ID)[1].CODE|lower, tree.getParents(section.ID)[1].NAME) }}
        </div>

        <div class="sibfil-placeholder"></div>

        <div class="sibfil">
          {% if tree.getSiblings(section.ID)|length %}
            <div class="siblings">
              <div class="siblings-title">
                Все подразделы
              </div>
              {% for b in tree.getSiblings(section.ID) %}
                <div class="siblings-item{% if section.ID == b.ID %} active{% endif %}">
                  {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
                </div>
              {% endfor %}
            </div>
          {% endif %}

          <div class="section-intro-filters">
            Фильтры
          </div>
        </div>
      </div>
    </div>
  {% endif %}

  <div class="section">
    {% if section.DESCRIPTION_HTML is not empty %}
      <div class="section-desc">
        {{ section.DESCRIPTION_HTML }}
      </div>
    {% endif %}

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
              {% if c.PRODUCT %}
                <div class="section-sections-item-products-main">
                  <a href="{{ url('catalog/' ~ c.PRODUCT.ID) }}">
                    <div class="iandb">
                      <div class="image">
                        {{ image('/cover/title/' ~ c.PRODUCT.ID ~ '/ph.jpg', 'class': 'img ph') }}
                        {{ image('/cover/title/' ~ c.PRODUCT.ID ~ '/large.jpg', 'class': 'img lazy') }}
                      </div>
                      <div class="buy">
                        Выбрать
                      </div>
                    </div>
                    <div class="tap">
                      <div class="title">
                        {{ c.PRODUCT.NAME }}
                      </div>
                      <div class="price">
                        {{ money(c.PRODUCT.PRICE, 0, ',', ' ') }} ₽
                      </div>
                    </div>
                  </a>
                </div>
              {% endif %}

              <div class="section-sections-item-products-list">
                <div class="products-list">
                  {% for product in c.PRODUCTS %}
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
                            {{ money(product.PRICE, 0, ',', ' ') }} ₽
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
                    {{ money(product.PRICE, 0, ',', ' ') }} ₽
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