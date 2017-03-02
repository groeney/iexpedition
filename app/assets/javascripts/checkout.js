$(document).on('turbolinks:load', function(){
  $(".order_item").on("ajax:success", function(e, data, status, xhr) {
    $(".container").append(xhr.responseText)
  }).on("ajax:error", function(e, xhr, status, error) {
    $(".container").append("<p>ERROR</p>")
  });
});