<header class="header">
  <div class="header-burger">
    <div class="burger">
      <div class="burger-line"></div>
      <div class="burger-line"></div>
      <div class="burger-line"></div>
    </div>
  </div>

  <div class="header-logo">
    <a href="/"><img src="/img/logo.svg"></a>
  </div>

  <div class="header-menu">

    {% for b in tree.getMenu() %}
      <div class="header-menu-item{% if b.active %} active{% endif %}">
        {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
      </div>
    {% endfor %}

    <div class="header-menu-item">
      <a href="/logo">Нанесение логотипов</a>
    </div>
  </div>

  <div class="header-phone">
    {{ config.site.phone }}
  </div>

  <div class="header-search">
    <form action="{{ url('search') }}">
      <input class="header-search-input" type="text" name="q" placeholder="Поиск">
      <input class="header-search-submit" type="submit" value="">
    </form>
  </div>

  <div class="header-search-icon">
    <a href="/search" class="search">

    </a>
  </div>

  <div class="header-bag">
    <a href="/personal/cart" class="bag">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
        <g>
          <polyline class="a" points="5.5 5.5 8.5 5.5 12.7 22.1"/>
          <circle class="b" cx="13.2" cy="24.2" r="2.2"/>
          <circle class="b" cx="21.2" cy="24.2" r="2.2"/>
          <polyline class="c" points="9.9 11.1 26.5 11.1 24 20.1 12 20.1"/>
        </g>
        {% set cnt = basket.getItems() %}
        <g class="cnt {% if cnt %}cnt-act{% endif %}">
          <circle class="d" cx="24" cy="8" r="8"/>
          <text class="f" x="24" y="12">{{ cnt }}</text>
        </g>
      </svg>
    </a>
  </div>
</header>

<div class="shadow"></div>

<nav class="mobile-nav">
    <div class="mobile-nav-menu">

    {% for b in tree.getMenu() %}
      <div class="mobile-nav-menu-item">
        {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
      </div>
    {% endfor %}

    <div class="mobile-nav-menu-item">
      <a href="/logo">Нанесение логотипов</a>
    </div>

    <div class="mobile-nav-menu-sep"></div>

    <div class="mobile-nav-menu-item">
      {{ link_to('about', 'О компании') }}
    </div>

    <div class="mobile-nav-menu-item">
      {{ link_to('contacts', 'Контакты') }}
    </div>

    <div class="mobile-nav-menu-sep"></div>


  </div>
</nav>
