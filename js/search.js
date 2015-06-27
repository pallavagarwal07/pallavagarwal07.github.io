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
    var div, i, item, j, k, l, len, len1, len2, len3, m, obj, pairs, posts, ref, searchText, tag, tags, title, txt, word;
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
      txt = $(pairs.item).children('.excerpt').text();
      tags = (function() {
        var j, len1, ref1, results;
        ref1 = $(pairs.item).children('.tags').text().split(',');
        results = [];
        for (j = 0, len1 = ref1.length; j < len1; j++) {
          k = ref1[j];
          if (k.indexOf(':') > -1) {
            results.push([k.split(':')[0].trim(), +k.split(':')[1]]);
          }
        }
        return results;
      })();
      for (j = 0, len1 = searchText.length; j < len1; j++) {
        word = searchText[j];
        if (word.length > 0) {
          pairs.score += 2 * title.count(word) + 1 * txt.count(word);
          for (l = 0, len2 = tags.length; l < len2; l++) {
            tag = tags[l];
            pairs.score += tag[1] * tag[0].count(word);
          }
        }
      }
    }
    obj = (function() {
      var len3, m, results;
      results = [];
      for (m = 0, len3 = obj.length; m < len3; m++) {
        k = obj[m];
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
    for (m = 0, len3 = obj.length; m < len3; m++) {
      div = obj[m];
      $('#content-holder').append(div.item);
    }
    if (obj.length === 0) {
      return $('#content-holder').append('Sorry, no search results found.');
    }
  };

  $(searchInit);

}).call(this);
