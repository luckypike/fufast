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
      <div class="header-menu-item">
        {{ link_to('catalog/' ~ b.CODE|lower, b.NAME) }}
      </div>
    {% endfor %}

    <div class="header-menu-item">
      <a href="/logo">Нанесение логотипов</a>
    </div>
  </div>

  <div class="header-phone">
    + 7 (831) 293-35-50
  </div>

  <div class="header-search">
    <form action="/search/">
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