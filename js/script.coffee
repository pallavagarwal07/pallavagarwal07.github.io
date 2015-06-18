---
---

window.requestAnimationFrame = window.requestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    (f) -> setTimeout(f, 1000/60)

this.parallax = () ->
    img = $('#bg-img')
    imgH = parseInt( img.css('height') )
    imgW = parseInt( img.css('width') )
    banH = parseInt( $('#menu').css('height') )
    divH = parseInt( $('#image').css('height') )
    if (banH+divH) > imgH
        $('#image').css('height', (imgH-banH)+'px')
    scrollTop = window.pageYOffset
    $('#bg-img').css('top', scrollTop * 1.3 + 'px')

window.addEventListener('scroll', (-> requestAnimationFrame(parallax)), false)
$(this.parallax)
