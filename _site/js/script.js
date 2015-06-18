(function() {
  window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || function(f) {
    return setTimeout(f, 1000 / 60);
  };

  this.parallax = function() {
    var banH, divH, img, imgH, imgW, scrollTop, top;
    img = $('#bg-img');
    imgH = parseInt(img.css('height'));
    imgW = parseInt(img.css('width'));
    banH = parseInt($('#menu').css('height'));
    divH = parseInt($('#image').css('height'));
    if ((banH + divH) >= imgH) {
      $('#image').css('height', (imgH - banH) + 'px');
    } else if ((imgH - banH) > 500) {
      $('#image').css('height', '500px');
    } else {
      $('#image').css('height', (imgH - banH) + 'px');
    }
    divH = parseInt($('#image').css('height'));
    scrollTop = window.pageYOffset;
    top = -(imgH - banH - divH) + scrollTop * (1 + (imgH - banH - divH) / (banH + divH));
    img.css('top', top + 'px');
    return img.css('clip', 'rect(' + (-top + banH) + 'px, auto, ' + (-top + banH + divH) + 'px, auto)');
  };

  window.addEventListener('scroll', (function() {
    return requestAnimationFrame(parallax);
  }), false);

  window.addEventListener('resize', (function() {
    return requestAnimationFrame(parallax);
  }), false);

  $(this.parallax);

}).call(this);
