(function() {
  var escapeRegExp, searchInit;

  escapeRegExp = function(str) {
    return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
  };

  String.prototype.count = function(word) {
    var score;
    word = escapeRegExp(word);
    score = (this.match(new RegExp('(([^\\w]|\^)' + word + '(?\!\\w))', 'gi')) || []).length;
    return score;
  };

  searchInit = function() {
    var div, i, item, j, k, l, len, len1, len2, obj, pairs, posts, ref, searchText, title, txt, word;
    posts = $('.post');
    obj = (function() {
      var i, len, results;
      results = [];
      for (i = 0, len = posts.length; i < len; i++) {
        item = posts[i];
        results.push({
          item: item,
          score: 0
        });
      }
      return results;
    })();
    ref = window.location.href.split('?query='), searchText = ref[ref.length - 1];
    searchText = decodeURIComponent(searchText).split(/[^\w]/);
    for (i = 0, len = obj.length; i < len; i++) {
      pairs = obj[i];
      title = $(pairs.item).children('.shead').text();
      txt = $(pairs.item).text();
      for (j = 0, len1 = searchText.length; j < len1; j++) {
        word = searchText[j];
        if (word.length > 0) {
          pairs.score += 2 * title.count(word) + 1 * txt.count(word);
        }
      }
    }
    obj = (function() {
      var l, len2, results;
      results = [];
      for (l = 0, len2 = obj.length; l < len2; l++) {
        k = obj[l];
        if (k.score !== 0) {
          results.push(k);
        }
      }
      return results;
    })();
    obj.sort(function(a, b) {
      return b.score - a.score;
    });
    $('#content-holder').html('');
    for (l = 0, len2 = obj.length; l < len2; l++) {
      div = obj[l];
      $('#content-holder').append(div.item);
    }
    if (obj.length === 0) {
      $('#content-holder').append('Sorry, no search results found.');
    }
    return console.log(obj);
  };

  $(searchInit);

}).call(this);
