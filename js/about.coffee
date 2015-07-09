---
---

init = () ->
    $('.active').removeClass('active')
    $('#about').addClass('active')

setInterval(init, 20)
