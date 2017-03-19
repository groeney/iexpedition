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

    var top = $('.lb-album').offset().top;
    const sum = $('.lb-overlay').length;
    var order = '';

    open_modal();
    next_button();
    prev_button();
    close_button();

    function reset_animation() {
      $('[data-order]').removeClass('left').removeClass('right');
    }

    function open_modal() {
      $('.region-select-js').on('click', function(){
        return order = $(this).parents('.wrap-li').find('.lb-overlay').css('top', top + 25).show().children('.lb-content').show().attr('data-order');
      })
    }

    function next_button() {
      $('.next-lightbox').on('click', function(){
        if (order < sum) {
          $('[data-order=${+order}]').hide()
          ++order
          reset_animation()
          $('[data-order=${+order}]').addClass('right').show().parent().css('top', top + 25)
        }
      })
    }

    function prev_button() {
      $('.prev-lightbox').on('click', function(){
        if ((order > 1) && (order <= sum)) {
          $('[data-order=${+order}]').hide();
          --order
          reset_animation()
          $('[data-order=${+order}]').addClass('left').show().parent().css('top', top + 25);
        }
      })
    }

    function close_button() {
      $('.close-lightbox').on('click', function(){
        reset_animation()
        $('.lb-overlay').hide();
      })
    }

  };
});