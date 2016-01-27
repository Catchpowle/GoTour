$( document ).ready(function() {
  SC.initialize({
    client_id: 'ac2a1002243ebe09524ba2818f4397d7'
  });
  var artist = $('h3').html();
  SC.get('/tracks', {
    q: artist
  }).then(function(tracks) {
      var track_url = tracks[0].permalink_url;
      SC.oEmbed(track_url, { auto_play: false }).then(function(oEmbed) {
      var player = $(oEmbed.html).attr('height', '200').attr('width', '600');
      $('#player').html(player);
    });
  });
});