$(document).on('turbolinks:load', function(){
  if ($('.pages.home').length > 0) {
    $('#duration-slider').slider({
      formatter: function(value) {
        return 'Current value: ' + value;
      }
    });

    $('#price-slider').slider({
      formatter: function(value) {
        return 'Current value: $' + value + 'k AUD';
      }
    });

    $('input.datepicker').datepicker({
      startDate: new Date()
    });

    $('.flexslider').flexslider({
      animation: "slide",
      animationLoop: false,
      itemWidth: 300,
      itemMargin: 5
    });

    $('.voyage-expedition').hover(
      function() {
        $(this).find('.voyage-hover').addClass('animate')
        $(this).find('.voyage-header').addClass('animate')
    }, function() {
      $(this).find('.voyage-hover').removeClass('animate')
      $(this).find('.voyage-header').removeClass('animate')
    })
  }
});
