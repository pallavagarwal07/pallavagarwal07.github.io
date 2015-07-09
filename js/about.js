(function() {
  var init;

  init = function() {
    $('.active').removeClass('active');
    return $('#about').addClass('active');
  };

  setInterval(init, 20);

}).call(this);
