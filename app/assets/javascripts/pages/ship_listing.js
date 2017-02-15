$(document).on('turbolinks:load', function(){
  $('.pages.ship_listing').ready(function(){

    $('.ship-wrap').hover(
      function() {
        $(this).find('.ship-hover').addClass('animate')
        $(this).find('.ship-header').addClass('animate')
    }, function() {
      $(this).find('.ship-hover').removeClass('animate')
      $(this).find('.ship-header').removeClass('animate')
    });

  });
});
