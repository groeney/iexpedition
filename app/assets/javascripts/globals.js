$(document).on('turbolinks:load', function(){
  $('.voyage-expedition').hover(
    function() {
      $(this).find('.voyage-hover').addClass('animate')
      $(this).find('.voyage-header').addClass('animate')
  }, function() {
    $(this).find('.voyage-hover').removeClass('animate')
    $(this).find('.voyage-header').removeClass('animate')
  });
});