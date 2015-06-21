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
    if (banH+divH) >= imgH
        $('#image').css('height', (imgH-banH)+'px')
    else if (imgH-banH) > 500
        $('#image').css('height', '500px')
    else
        $('#image').css('height', (imgH-banH)+'px')

    divH = parseInt( $('#image').css('height') )
    scrollTop = window.pageYOffset
    top = -(imgH - banH - divH) + scrollTop * (1+(imgH-banH-divH)/(banH+divH))
    img.css('top', top + 'px')
    img.css('clip', 'rect('+(-top+banH)+'px, auto, '+(-top+banH+divH)+'px, auto)')

this.imgSet = () ->
    arr = $('.img-responsive')
    for i in [0..arr.length-1]
        im2 = $(arr[i])
        console.log(im2)
        im2.on("click", ->
            console.log(this)
            $('#imagepreview').attr('src', $(this).attr('src'))
            $('#imagemodal').modal('show')
        )

window.addEventListener('scroll', (-> requestAnimationFrame(parallax)), false)
window.addEventListener('resize', (-> requestAnimationFrame(parallax)), false)
$(this.parallax)
$(this.imgSet)
