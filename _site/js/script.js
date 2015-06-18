(function() {
  window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || function(f) {
    return setTimeout(f, 1000 / 60);
  };

  this.parallax = function() {
    var banH, divH, img, imgH, imgW, scrollTop;
    img = $('#bg-img');
    imgH = parseInt(img.css('height'));
    imgW = parseInt(img.css('width'));
    banH = parseInt($('#menu').css('height'));
    divH = parseInt($('#image').css('height'));
    if ((banH + divH) > imgH) {
      $('#image').css('height', (imgH - banH) + 'px');
    }
    scrollTop = window.pageYOffset;
    return $('#bg-img').css('top', scrollTop * 1.3 + 'px');
  };

  window.addEventListener('scroll', (function() {
    return requestAnimationFrame(parallax);
  }), false);

  $(this.parallax);

}).call(this);
