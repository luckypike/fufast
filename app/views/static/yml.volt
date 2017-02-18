<yml_catalog date="{{ date }}">
  <shop>
    <name>{{ config.site.site_name }}</name>
    <company>{{ config.site.site_name }}</company>
    <url>http://fufayka.info{{ url('/') }}</url>
    
    <currencies>
      <currency id="RUR" rate="1" plus="0"></currency>
    </currencies>

    <categories>
      {% for section in tree.getAll() %}
        <category id="{{ section['ID'] }}">{{ section['NAME'] }}</category>
      {% endfor %}
    </categories>

    <offers>
      {% for product in products %}
        <offer id="{{ product['ID'] }}" available="true">
          <url>http://fufayka.info{{ url('catalog/' ~ product['ID']) }}</url>
          <price>{{ int(product['PRICE']) }}</price>
          <categoryId>{{ product['IBLOCK_SECTION_ID'] }}</categoryId>
          <currencyId>RUR</currencyId>
          <picture>http://fufayka.info{{ url('cover/' ~ product['ID'] ~ '/large.jpg') }}</picture>
          <name>{{ product['NAME'] }}</name>
          <description>
            {{ product['DETAIL_TEXT_PLAIN'] }}
          </description>
        </offer>
      {% endfor %}
    </offers>
  </shop>
</yml_catalog>