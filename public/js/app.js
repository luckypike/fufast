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
});