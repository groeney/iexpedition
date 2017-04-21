$(document).on('turbolinks:load', function(){
  if ($('.pages.home').length > 0) {
    $('#duration-slider').slider({
      formatter: function(value) {
        return value + ' Days';
      }
    });

    $('#price-slider').slider({
      formatter: function(value) {
        return 'AUD$' + (value/1000) + 'K';
      }
    });

    $('input.datepicker').datepicker({
      startDate: new Date()
    });

    $('.flexslider').flexslider({
      animation: 'slide',
      animationLoop: false,
      itemWidth: 300,
      itemMargin: 5
    });
  }
});
