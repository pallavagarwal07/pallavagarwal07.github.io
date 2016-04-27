---
---
init = () ->
    $('.active').removeClass('active')
    $('#gsoc').addClass('active')

setInterval(init, 20)
