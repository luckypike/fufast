{% extends "app.volt" %}

{% block content %}
  {{ javascript_include('https://api-maps.yandex.ru/2.1/?lang=ru_RU', false) }}

  <div class="section-intro section-intro-root1 section-intro-contacts">
    <div class="text">
      <div class="title">
        <h1>
          Контакты
        </h1>        
      </div>
    </div>
  </div>

  <div class="page-static page-content">
    <p>
      ООО «Поволжье-спецодежда» (торговая марка «Фуфайка») 
    </p>

    <h2>
      Телефон
    </h2>

    <p>
      +7 (831) 293-35-50
    </p>

    <h2>
      Время работы
    </h2>

    <p>
      ПН-ПТ: с 9:00 до 18:00
    </p>

    <h2>
    Адрес
    </h2>
    <p>
      Волкова, 5А, Нижний Новгород, 603041, Россия
    </p>
    <div class="map-ar">
      <div id="map" class="ar"></div>  
    </div>
  </div>

<script type="text/javascript">
  ymaps.ready(init);
    var myMap,
        myPlacemark;

    function init(){     
        myMap = new ymaps.Map ("map", {
            center: [56.242654, 43.830420],
            zoom: 17
        });

        var myPlacemark = new ymaps.Placemark([56.242654, 43.830420], {
            iconContent: 'Интернет-магазин «Фуфайка»'
        }, {
            // Красная иконка, растягивающаяся под содержимое.
            preset: "islands#redStretchyIcon"
        });        

        myMap.geoObjects.add(myPlacemark);
    }
</script>

  
{% endblock %}