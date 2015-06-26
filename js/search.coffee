---
---
escapeRegExp = (str) ->
    str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")

String.prototype.count = (word) ->
    word = escapeRegExp(word)
    score = (this.match(new RegExp('(([^\\w]|\^)' \
        + word + '(?\!\\w))', 'gi')) || []).length
    score

searchInit = () ->
    # Get array of posts with short description
    posts = $('.post')

    # Assign a score to each of them
    obj = ({item, score: 0} for item in posts)

    # get search text from url, decode it, and break it into words.
    [..., searchText] = window.location.href.split('?')
    searchText = decodeURIComponent(searchText).split(/[^\w]/)

    for pairs in obj
        title = $(pairs.item).children('.shead').text()
        txt = $(pairs.item).text()
        for word in searchText
            if word.length > 0
                pairs.score += 2*title.count(word)+1*txt.count(word)
    obj = (k for k in obj when k.score != 0)
    obj.sort((a, b) -> b.score-a.score)

    $('#content-holder').html('')
    for div in obj
        $('#content-holder').append(div.item)
    if obj.length == 0
        $('#content-holder').append('Sorry, no search results found.')

    console.log(obj)


$(searchInit)
