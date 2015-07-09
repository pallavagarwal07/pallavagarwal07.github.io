---
---

window.requestAnimationFrame = window.requestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    (f) -> setTimeout(f, 1000/60)

parallax = () ->
    img = $('#bg-img')
    imgH = img.height()
    imgW = img.height()
    banH = $('#menu').height()
    divH = $('#image').height()
    if img.css('display') != 'none'
        if (banH+divH) >= imgH
            $('#image').css('height', (imgH-banH)+'px')
        else if (imgH-banH) > 500
            $('#image').css('height', '500px')
        else
            $('#image').css('height', (imgH-banH)+'px')

    divH = $('#image').height()
    scrollTop = window.pageYOffset
    top = -(imgH - banH - divH) + scrollTop * (1+(imgH-banH-divH)/(banH+divH))
    if img.css('display') != 'none'
        img.css('top', top + 'px')
        img.css('clip', 'rect('+(-top+banH)+'px, auto, '+(-top+banH+divH)+'px, auto)')
    if -top+banH+divH < 0 && img.css('display') != 'none'
        img.hide()
    else if -top+banH+divH >0 && img.css('display') == 'none'
        img.show()

imgSet = () ->
    arr = $('.img-responsive')
    for i in [0..arr.length-1]
        im2 = $(arr[i])
        im2.on("click", ->
            $('#imagepreview').attr('src', $(this).attr('src'))
            $('#imagemodal').modal('show')
        )

window.addEventListener('scroll', (-> requestAnimationFrame(parallax)), false)
window.addEventListener('resize', (-> requestAnimationFrame(parallax)), false)
$(parallax)
$(imgSet)
window.setInterval(parallax, 500)
