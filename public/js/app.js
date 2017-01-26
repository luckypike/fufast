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

});