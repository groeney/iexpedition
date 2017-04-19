$(document).on('turbolinks:load', function(){
  if ($('.search.voyages, .search.ships, .search.antarctica, .search.arctic').length > 0) {
    if ($('#durationSlider').length == 0){
      $('#duration-slider').slider({
        formatter: function(value) {
          return 'Current value: ' + value + ' Days';
        }
      });
    }

    if ($('#priceSlider').length == 0){
      $('#price-slider').slider({
        formatter: function(value) {
          return 'Current value: AUD$' + (value/1000) + 'K';
        }
      });
    }

    $('input.datepicker').datepicker({
      startDate: new Date()
    });
  }
});
