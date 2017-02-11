$(document).on('turbolinks:load', function(){
  $('.pages.home').ready(function(){
    $('.input-group.date').datepicker({
        startDate: new Date()
    });

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
  });
});