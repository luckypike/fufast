<section class="benefits">
  <div class="benefits-list">
    <div class="benefits-item">
      <div class="icn icn-1"></div>
      <div class="desc">
        Выгодная доставка
      </div>
    </div>

    <div class="benefits-item">
      <div class="icn icn-2"></div>
      <div class="desc">
        Бесплатная консультация
      </div>
    </div>

    <div class="benefits-item">
      <div class="icn icn-3"></div>
      <div class="desc">
        Распродажа
      </div>
    </div>

    <a href="mailto:info@fufayka.info" class="benefits-item">
      <div class="icn icn-4"></div>
      <div class="desc">
        info@fufayka.info
      </div>
    </a>

    <div class="benefits-item inact">
      <div class="icn icn-5"></div>
      <div class="desc">
        Заказать звонок
      </div>
    </div>
  </div>
</section>

<footer class="footer">
  <div class="footer-menu">
    <div class="footer-menu-item">
      <a href="/about">Компания</a>
    </div>

    <div class="footer-menu-item">
      <a href="/contacts">Контакты</a>
    </div>

  </div>

  <div class="footer-like">
    <a href="https://luckypike.com">L..IKE</a>

  </div>
</footer>


{% if config.site.production %}
  <!-- Yandex.Metrika counter -->
  <script type="text/javascript">
      (function (d, w, c) {
          (w[c] = w[c] || []).push(function() {
              try {
                  w.yaCounter38766390 = new Ya.Metrika({
                      id:38766390,
                      clickmap:true,
                      trackLinks:true,
                      accurateTrackBounce:true,
                      webvisor:true
                  });
              } catch(e) { }
          });

          var n = d.getElementsByTagName("script")[0],
              s = d.createElement("script"),
              f = function () { n.parentNode.insertBefore(s, n); };
          s.type = "text/javascript";
          s.async = true;
          s.src = "https://mc.yandex.ru/metrika/watch.js";

          if (w.opera == "[object Opera]") {
              d.addEventListener("DOMContentLoaded", f, false);
          } else { f(); }
      })(document, window, "yandex_metrika_callbacks");
  </script>
  <noscript><div><img src="https://mc.yandex.ru/watch/38766390" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
  <!-- /Yandex.Metrika counter -->
{% endif %}