---
---
init = () ->
    $('.active').removeClass('active')
    $('#tips').addClass('active')

setInterval(init, 20)
