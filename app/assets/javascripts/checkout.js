$(document).on('turbolinks:load', function(){
  $('#new_order_details input.datepicker').datepicker({
    format: 'yyyy-mm-dd'
  });

  var checkForm = function() {
    var radioSelected = true;
    var countrySelected = true;

    $("#new_order_details .gender").each(function(_, element) {
      if (!$(element).find("input[type='radio']:checked").val() ) {
        $(element).find('.error').remove();
        $(element).append("<span class='error'>can't be blank</span>");
        radioSelected = false;
      }
    });

    $(".country_select_validation").each(function(_, element) {
      if($(element).find('select').val().length == 0){
        $(element).find('.error').remove();
        $(element).append("<span class='error'>can't be blank</span>");
        countrySelected = false;
      }
    });

    return radioSelected && countrySelected
  };

  $('.gender .radio-option').click(function() {
    $("#new_order_details .gender").each(function(_, element) {
      if ($(element).find("input[type='radio']:checked").val() ) {
        $(element).find('.error').remove();
      }
    });
  });

  $(".country_select_validation select").change(function() {
    $(".country_select_validation").each(function(_, element) {
      if($(element).find('select').val().length == 0){
        $(element).find('.error').remove();
        $(element).append("<span class='error'>can't be blank</span>");
      } else {
        $(element).find('.error').remove();
      }
    });
  });
  
  ClientSideValidations.callbacks.form.fail = checkForm;
  $("#new_order_details" ).submit(checkForm);

});