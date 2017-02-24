$(document).on('turbolinks:load', function(){
  if ($('.search.voyages, .search.ships, .search.antarctica, .search.arctic').length > 0) {
    if ($('#durationSlider').length == 0){
      debugger
      $('#duration-slider').slider({
        formatter: function(value) {
          return 'Current value: ' + value;
        }
      });
    }

    if ($('#priceSlider').length == 0){
      $('#price-slider').slider({
        formatter: function(value) {
          return 'Current value: $' + value + 'k AUD';
        }
      });
    }

    $('input.datepicker').datepicker({
      startDate: new Date()
    });
  }
});
