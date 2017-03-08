$(document).on('turbolinks:load', function(){
  if ($('.dashboard.personal_details, .dashboard.home').length > 0) {
    $('.dob input.datepicker').datepicker({
      endDate: new Date(),
      startDate: new Date('1900'),
      format: 'yyyy-mm-dd'
    });

    $('.passport_issue_date input.datepicker').datepicker({
      endDate: new Date(),
      startDate: new Date('2000'),
      format: 'yyyy-mm-dd'
    });

    $('.passport_expiry_date input.datepicker').datepicker({
      startDate: new Date(),
      format: 'yyyy-mm-dd'
    });
  }
});
