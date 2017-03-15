$(document).on('turbolinks:load', function(){
  $('.voyage-expedition').hover(
    function() {
      $(this).find('.voyage-hover').addClass('animate')
      $(this).find('.voyage-header').addClass('animate')
  }, function() {
    $(this).find('.voyage-hover').removeClass('animate')
    $(this).find('.voyage-header').removeClass('animate')
  });

  $('.ship-wrap').hover(
    function() {
      $(this).find('.ship-hover').addClass('animate')
      $(this).find('.ship-header').addClass('animate')
  }, function() {
    $(this).find('.ship-hover').removeClass('animate')
    $(this).find('.ship-header').removeClass('animate')
  });

  $('.image-region').hover(
    function() {
      $(this).find('.regions-info-hover').addClass('animate')
  }, function() {
    $(this).find('.regions-info-hover').removeClass('animate')
  });


  $('.favourite-voyage').on('click', function(){
    var KEY = 'favourite_voyage_ids';
    var voyageFavs = Cookies.getJSON(KEY) || [];
    var voyageID = $(this).data('voyage-id');
    var i = voyageFavs.indexOf(voyageID)
    if (i > 0){
      voyageFavs.splice(i, 1);
    } else {
      voyageFavs.push(voyageID);
    }
    Cookies.set(KEY, $.unique(voyageFavs));
    $(this).find('i').toggleClass('fa-star fa-star-o')
  });

  $('.favourite-ship').on('click', function(){
    var KEY = 'favourite_ship_ids';
    var shipFavs = Cookies.getJSON(KEY) || [];
    var shipID = $(this).data('ship-id');
    var i = shipFavs.indexOf(shipID);
    if (i > 0){
      shipFavs.splice(i, 1);
    } else {
      shipFavs.push(shipID);
    }
    Cookies.set(KEY, $.unique(shipFavs));
    $(this).find('i').toggleClass('fa-star fa-star-o')
  });
});
