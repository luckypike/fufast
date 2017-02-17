$(function() {
  var _bx = $('.bxslider');
  if(_bx.length > 0) {
    $('.bxslider').bxSlider({
      pagerCustom: '#bx-pager',
      hideControlOnEnd: true,
      infiniteLoop: false,
      nextText: '<svg viewBox="0 0 60 60"><polyline points="25,16 35,30 25,44 "/></svg>',
      prevText: '<svg viewBox="0 0 60 60"><polyline points="35,16 25,30 35,44 "/></svg>',
    });
  }

  _html = $('html');

  $('.burger').on('click', function() {
    _html.toggleClass('openburger');
    return false;
  });

  _html.on('click touchstart', '.shadow', function() {
    _html.removeClass('openburger');
  });

  // $("img.lazy").lazyload({
  //   effect : "fadeIn"
  // });

  var _mim = $('.section-sections-item-products-main');

  _mim.on('update', function() {
    var _this = $(this);
    if(_this.parent().width() < 920) {
      _this.find('.iandb').css('height', 'auto');
    } else {
      var _ih = _this.next().find('.products-list-item');
      var _ihf = _ih.first();
      var height = _ihf.outerHeight(true);
      var ch = height - _ihf.find('.iandb').height();

      if(_ih.length > 4) {
        var _ihl = _ih.last();
        height = height + _ihl.outerHeight(true);
        ch = _ihl.outerHeight(true) - _ihl.find('.iandb').height();
      }

      _this.find('.iandb').height(height - ch);
    }
  }).trigger('update');


  var _sis = $('.sibfil');
  var _header = $('header.header');
  var _window = $(window);

  _sis.on('update', function() {
    var _this = $(this);
    var _ph = _this.prev();
    var _ttl = _this.prev().prev();
    _ph.height(_this.height());
    if(!_this.is('.abs')) _this.addClass('abs');

    var is_root = _this.closest('.section-intro-wrapper').is('.section-intro-wrapper-root1');
    var x = 0;

    if (is_root) x = -64;

    if(_this.find('.siblings-title').is(':visible')) {
      _ttl.css('margin-top', x);
    } else {
      if(is_root) _ttl.css('margin-top', _this.find('.siblings').outerHeight(true) * -1 + x);
    }

  }).trigger('update').on('move', function() {
    var _this = $(this);
    var _ph = _this.prev();
    // console.log(_window.scrollTop());
    // console.log((_ph.offset().top - _header.height()));
    if(_window.scrollTop() >= (_ph.offset().top - _header.height())) {
      _this.addClass('sticky');
    } else {
      _this.removeClass('sticky');
    }

  }).trigger('move');

  _window.on('resize', function() {
    _mim.trigger('update');
    _sis.trigger('update');
  }).on('scroll', function() {
    _sis.trigger('move');
  });

  var _o2b = $('.order-to-basket .button');
  var _msg = $('.product-details .msg');
  var _op = $('.order-price');
  var _opp = _op.find('.price');
  var _srii = $('.sizes-row-input input');

  _o2b.on('click', function() {
    if(_o2b.data('size') && !_o2b.is('.prc')) {
      values = new Array();
      _srii.each(function() {
        var _this = $(this);
        if(v = _this.val()) {
          values.push({
            number: _this.data('number'),
            quantity: _this.val(),
            size: _this.data('size'),
            height: _this.data('height'),
            assort: _this.data('assort')
          });
        }
      });

      _msg.removeClass('act');
      _o2b.addClass('prc');

      $.post(
        '/personal/add2basket_ajax.php',
        {
          action: 'ADD2BASKET',
          id: _o2b.data('id'),
          value: values
        },
        function(data){
          var user = data;
          $.get('/catalog/basket', { user: user }, function(data) {
            $('.header-bag .cnt').addClass('cnt-act').find('text').text(data);
          });
          _msg.addClass('suc').text('Товар успешно добавлен в корзину.');
          _o2b.removeClass('prc');
          _srii.val(null);
        }
      );



    } else {
      _msg.removeClass('suc').addClass('act').text('Необходимо выбрать размер чтобы сделать заказ.');
    }
  }).on('update', function() {
    var act = 0;
    _srii.each(function() {
      if($(this).val()) {
        act += parseInt($(this).val());
      }
      if(act) {
        $('.sizes-clear').addClass('act');
        _op.addClass('r2o');
        _opp.text((parseInt(_opp.data('price')) * act) + ' руб.' );
        _o2b.data('size', true);
      } else {
        $('.sizes-clear').removeClass('act');
        _op.removeClass('r2o');
        _opp.text(_opp.data('price-human') + ' руб.' );
        _o2b.data('size', false);
      }
    });
  }).trigger('update');

  $('.sizes-clear span').on('click', function() {
    _srii.val(null);
    $(this).parent().removeClass('act');
  });


  _srii.on('change keyup', function() {
    var _this = $(this);
    var val = parseInt(_this.val());
    if(isNaN(val)) val = null;
    _this.val(val);
    _o2b.trigger('update');
  }).on('plus', function() {
    var _this = $(this);
    var val = parseInt(_this.val());
    if(isNaN(val)) val = 0;
    val += 1;
    _this.val(val);
    _o2b.trigger('update');
  }).on('minus', function() {
    var _this = $(this);
    var val = parseInt(_this.val());
    if(isNaN(val)) val = 0;
    val -= 1;
    if(val < 1) val = null;
    _this.val(val);
    _o2b.trigger('update');
  });

  $('.sizes-row-plus').on('click', function() {
    $(this).prev().children('input').trigger('plus');
  });

  $('.sizes-row-minus').on('click', function() {
    $(this).next().children('input').trigger('minus');
  });

  if ($.isFunction($.fn.slick)) {
    $('.page-index-main-slider .slider').slick({
      arrows: false,
      dots: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 6000
    });

    var _logos = $('.page-index-section-s5 .logos');

    _logos.slick({
        arrows: false,
        // dots: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 3000
    }).on('beforeChange', function(event, slick, currentSlide, nextSlide) {
        $('.logos-mini-item-' + (currentSlide + 1)).removeClass('active');
        $('.logos-mini-item-' + (nextSlide + 1)).addClass('active');
    });

    $('.logos-mini').on('click', '.logos-mini-item', function() {
      _logos.slick('slickGoTo', $(this).attr('rel'));
    });

    $('.page-index-section-goods').each(function() {
      $(this).slick({
        slidesToShow: 2,
        slidesToScroll: 2,
        arrows: false,
        dots: true,
        autoplay: true,
        autoplaySpeed: (Math.random() * 4000) + 2500,
        responsive: [{
          breakpoint: 768,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
          }
        }]
      });
    });
  }

  // var _mn_slider = $('.page-index-main-slider .slider');
  // if(_mn_slider.length > 0) {
  //   _mn_slider.bxSlider({
  //     controls: false,
  //     buildPager: function(i) {
  //       return '';
  //     }
  //   });
  // }

  // $('.page-index-section-goods').bxSlider({
  //   minSlides: 2,
  //   maxSlides: 2,
  //   controls: false,
  //     buildPager: function(i) {
  //       return '';
  //     }
  // });
});