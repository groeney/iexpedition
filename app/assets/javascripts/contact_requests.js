$(document).on('turbolinks:load', function(){
    $('#new_contact_request input.datepicker').datepicker({
        format: 'yyyy-mm-dd'
    });
});
