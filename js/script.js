(function() {
  var imgSet, parallax;

  window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || function(f) {
    return setTimeout(f, 1000 / 60);
  };

  parallax = function() {
    var banH, divH, img, imgH, imgW, scrollTop, top;
    img = $('#bg-img');
    imgH = img.height();
    imgW = img.height();
    banH = $('#menu').height();
    divH = $('#image').height();
    if (img.css('display') !== 'none') {
      if ((banH + divH) >= imgH) {
        $('#image').css('height', (imgH - banH) + 'px');
      } else if ((imgH - banH) > 500) {
        $('#image').css('height', '500px');
      } else {
        $('#image').css('height', (imgH - banH) + 'px');
      }
    }
    divH = $('#image').height();
    scrollTop = window.pageYOffset;
    top = -(imgH - banH - divH) + scrollTop * (1 + (imgH - banH - divH) / (banH + divH));
    if (img.css('display') !== 'none') {
      img.css('top', top + 'px');
      img.css('clip', 'rect(' + (-top + banH) + 'px, auto, ' + (-top + banH + divH) + 'px, auto)');
    }
    if (-top + banH + divH < 0 && img.css('display') !== 'none') {
      return img.hide();
    } else if (-top + banH + divH > 0 && img.css('display') === 'none') {
      return img.show();
    }
  };

  imgSet = function() {
    var arr, i, im2, j, ref, results;
    arr = $('.img-responsive');
    results = [];
    for (i = j = 0, ref = arr.length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
      im2 = $(arr[i]);
      results.push(im2.on("click", function() {
        $('#imagepreview').attr('src', $(this).attr('src'));
        return $('#imagemodal').modal('show');
      }));
    }
    return results;
  };

  window.addEventListener('scroll', (function() {
    return requestAnimationFrame(parallax);
  }), false);

  window.addEventListener('resize', (function() {
    return requestAnimationFrame(parallax);
  }), false);

  window.setInterval(imgSet, 20);

  window.setInterval(parallax, 20);

}).call(this);
