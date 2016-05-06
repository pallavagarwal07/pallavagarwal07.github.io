(function() {
  var init;

  init = function() {
    $('.active').removeClass('active');
    return $('#gsoc').addClass('active');
  };

  setInterval(init, 20);

}).call(this);
