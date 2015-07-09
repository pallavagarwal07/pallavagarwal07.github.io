---
---
init = () ->
    $('.active').removeClass('active')
    $('#tips').addClass('active')

setInterval(init, 200)
