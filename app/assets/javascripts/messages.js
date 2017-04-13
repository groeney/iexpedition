function success_message(message) {
  $("#success_message").text(message).fadeIn().delay(5000).fadeOut();
}

function error_message(message) {
  $("#error_message").text(message).fadeIn().delay(5000).fadeOut();
}

$(document).on('turbolinks:load', function(){
  var flashMessage = $("#flash_message");
  if ( flashMessage.length ) {
    var message = flashMessage.data("message");
    var level = flashMessage.data("level");
    if ( ['notice', 'success'].includes(level) ) {
      success_message(message)
    } else {
      error_message(message)
    }
  }
});