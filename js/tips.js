(function() {
  var init;

  init = function() {
    $('.active').removeClass('active');
    return $('#tips').addClass('active');
  };

  setInterval(init, 200);

}).call(this);
