$(document).on('turbolinks:load', function(){
  if ($('.destinations.show').length > 0) {
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
  };
});