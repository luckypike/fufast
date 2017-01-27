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

  _html.on('click touchstart', '.ff-wrapper', function(e) {
    var _target = $(e.target);
    if(_target.is('.ff-wrapper') &&_html.is('.openburger')) {
      _html.removeClass('openburger');
      return false;
    }
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


  var _sis = $('.section-intro .siblings');
  var _header = $('header.header');
  var _window = $(window);

  _sis.on('update', function() {
    var _this = $(this);
    var _ph = _this.prev();
    _ph.height(_this.height());
  }).trigger('update').on('move', function() {
    var _this = $(this);
    var _ph = _this.prev();
    if(_window.scrollTop() >= (_ph.offset().top - _header.height() - 28)) {
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