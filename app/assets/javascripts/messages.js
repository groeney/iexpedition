function success_message(message) {
  $("#success_message").text(message).fadeIn().delay(5000).fadeOut();
}

function error_message(message) {
  $("#error_message").text(message).fadeIn().delay(5000).fadeOut();
}