(function() {
  var init;

  init = function() {
    $('.active').removeClass('active');
    return $('#algo').addClass('active');
  };

  setInterval(init, 20);

}).call(this);