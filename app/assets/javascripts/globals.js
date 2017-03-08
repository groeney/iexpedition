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
});