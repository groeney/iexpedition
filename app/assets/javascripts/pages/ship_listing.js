$(document).on('turbolinks:load', function(){
  if ($('.pages.ship_listing').length > 0) {

    $('.ship-wrap').hover(
      function() {
        $(this).find('.ship-hover').addClass('animate')
        $(this).find('.ship-header').addClass('animate')
    }, function() {
      $(this).find('.ship-hover').removeClass('animate')
      $(this).find('.ship-header').removeClass('animate')
    });

  }
});
