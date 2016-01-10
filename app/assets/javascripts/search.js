$(document).ready(function(){

  var searchResultList = _.template("<h3>Results (<%= results.length %>)</h3><ul class='results'></ul>");
  var searchResult = _.template("<li class='result'><%= result.name %></li>");

  $('#search').keyup(function(e) {
    var searchTerm = $(e.currentTarget).val();

    $.ajax({
      url: '/artists/search',
      data: {
        search: searchTerm
      },
      success: function(results) {
        var resultList = $('#search-results');
        resultList.html(searchResultList({ results: results}));
        if ( results.length > 0 ){
          _(results).each(function(result) {
            resultList.find('.results').append(searchResult({result: result}));
          });
        }else{
          resultList.append("<p>No results found.</p>");
        }
      }
    });
  });
});
