{% extends "app.volt" %}

{% block content %}
  {{ javascript_include('js/jquery.bxslider.min.js') }}

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

    {% for section in sections %}
      <section class="page-index-section page-index-section-invert section-s1">
        <div class="page-index-section-image image-s1">
          <div class="img"></div>
          <div class="text">
            <h1>{{ section['section'] }}</h1>
            <div class="action">
              <a href="/catalog/overall/" class="button">Коллекция спецодежды</a>

            </div>
          </div>
        </div>

        <div class="page-index-section-goods goods-s1 goods">
          {% for products in section['goods'] %}
            <div class="goods-slide"><div class="products-list">
              {% for product in products %}
                <div class="products-list-item">
                  <a href="{{ url('catalog/' ~ product['ID']) }}">
                    <div class="iandb">
                      <div class="image" style="background-image: url({{ '/cover/' ~ product['ID'] ~ '/list.jpg' }})">
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
                        {{ money(product['PRICE'], 0, ',', ' ') }} руб.
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



<!--
        <?php
        $goods = array(array(2577, 2030), array(2646, 2499), array(1677, 2639), array(1682, 1513));

          foreach($goods as $items) {
            print '<div class="goods-slide"><div class="goods-group">';
            foreach($items as $item) {
              $res = CIBlockElement::GetByID($item);
              $ar_res = $res->GetNextElement();
              $fields = $ar_res->GetFields();
              $properties = $ar_res->GetProperties();
              $rsPrices = CPrice::GetList(array(), array('PRODUCT_ID' => $item, 'CATALOG_GROUP_ID' => 1));
              $renderImage = CFile::ResizeImageGet($fields["DETAIL_PICTURE"], Array("width" => 800, "height" => 1000), BX_RESIZE_IMAGE_PROPORTIONAL, false, false, false, 50);
              ?>
                <div class="goods-item">
                  <a href="<?php print $fields['DETAIL_PAGE_URL'] ?>">
                    <div class="img-ar">
                      <?php print CFile::ShowImage($renderImage['src']) ?>
                    </div>

                    <div class="tanp">
                      <div class="title">
                        <?php print $fields['NAME'] ?>
                      </div>

                      <?php if ($arPrice = $rsPrices->Fetch()): ?>
                        <div class="price">
                          <?php print number_format($arPrice['PRICE'], 0, ',', '') ?> руб.
                        </div>
                      <?php endif ?>
                    </div>
                  </a>
                </div>
              <?php
            }
            print '</div></div>';
          }
        ?>
      </div> -->


  </div>

{% endblock %}


