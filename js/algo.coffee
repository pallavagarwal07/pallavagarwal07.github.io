---
---
init = () ->
    $('.active').removeClass('active')
    $('#algo').addClass('active')

setInterval(init, 20)
