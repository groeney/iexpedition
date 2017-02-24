$(document).on('turbolinks:load', function(){
  // if ($('.destinations.show').length > 0) {
  //   $('#duration-slider').slider({
  //     formatter: function(value) {
  //       return 'Current value: ' + value;
  //     }
  //   });
  $('#price-slider').slider({
    formatter: function(value) {
      return 'Current value: $' + value + 'k AUD';
    }
  });

  var if_main_slider = $('.with-main-slider').length
  var top_album = $('.lb-album').offset().top
  var sum = $('.lb-overlay').length
  var arrow = $('.cabin-options')
  var order = '';

  replace_popup_slider();

  open_modal();
  next_button();
  prev_button();
  close_button();

  $(window).resize(function(){
    $('.lb-overlay').css({'left': -whichSize()[1], 'width': whichSize()[0]})
  });

  function reset_animation() {
    $('[data-order]').removeClass('left').removeClass('right');
    $('.next-lightbox').add('.prev-lightbox').removeAttr('style')
  }

  function whichSize() {
    var width_album = $(window).width();
    var left_album = $('.lb-album').offset().left;
    return [width_album, left_album];
  }

  function disableButton() {
    if (order == sum)
      $('.next-lightbox').css('opacity', 0.5);

    if ( order == 1 )
      $('.prev-lightbox').css('opacity', 0.5);
  }

  function open_modal() {
    $('.region-select-js').on('click', function(){
      $('.cabin-options').show()
      if (if_main_slider) {
          order = $(this).parents('.wrap-li').data('main-order');
          $(this).parents('.lb-album').find('[data-order=' + +order + ']').parent('.lb-overlay').css({'width': whichSize()[0], 'top': -25, 'left': -whichSize()[1]}).show().children('.lb-content').show();
          disableButton()
      } else if ( $('.lb-album').hasClass('not_offset') ) {
          order = $(this).parents('.wrap-li').find('.lb-overlay').css({'width': whichSize()[0], 'top': -25, 'left': -whichSize()[1]}).show().children('.lb-content').show().data('order');
          disableButton()
          return order
      } else {
          order = $(this).parents('.wrap-li').find('.lb-overlay').css('top', top_album + 25).show().children('.lb-content').show().data('order');
          disableButton()
          return order
      }
    })
  }

  function next_button() {
    $('.next-lightbox').on('click', function(){
      if (order < sum) {
        $('[data-order=' + +order + ']').hide()
        ++order
        reset_animation()
        disableButton()
        if (if_main_slider) {
            $('.flex-next').click()
            $('[data-order=' + +order + ']').addClass('right').show().parent('.lb-overlay').css({'width': whichSize()[0], 'top': -25, 'left': -whichSize()[1]})
        } else if ( $('.lb-album').hasClass('not_offset') ) {
            $('[data-order=' + +order + ']').addClass('right').show().parent().css({'width': whichSize()[0], 'top': -25, 'left': -whichSize()[1]})
        } else {
            $('[data-order=' + +order + ']').addClass('right').show().parent().css('top', top_album + 25)
        }
      }
    })
  }

  function prev_button() {
    $('.prev-lightbox').on('click', function(){
      if ((order > 1) && (order <= sum)) {
        $('[data-order=' + +order + ']').hide();
        --order
        reset_animation()
        disableButton()
        if (if_main_slider) {
            $('.flex-prev').click()
            $('[data-order=' + +order + ']').addClass('left').show().parent('.lb-overlay').css({'width': whichSize()[0], 'top': -25, 'left': -whichSize()[1]})
        } else if ( $('.lb-album').hasClass('not_offset') ) {
            $('[data-order=' + +order + ']').addClass('left').show().parent().css({'width': whichSize()[0], 'top': -25, 'left': -whichSize()[1]})
        } else {
            $('[data-order=' + +order + ']').addClass('left').show().parent().css('top', top_album + 25);
        }
      }
    })
  }

  function close_button() {
    $('.close-lightbox').on('click', function(){
      reset_animation()
      $('.lb-overlay').hide();
      $(arrow).hide();
    })
  }

  function replace_popup_slider() {
    if (if_main_slider) {
      window.arr = $('.lb-overlay').clone(true)
      $('.lb-overlay').detach()
      $('.lb-album').prepend(arr);
    }
  }

  // };
});