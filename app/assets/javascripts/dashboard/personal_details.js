$(document).on('turbolinks:load', function(){

    if ($('.tabbed-content').length) {

        showAllTabs();

        function showAllTabs() {
            var openAllBtn = $('h5.open-all'),
                closeAllBtn = $('h5.close-all'),
                allTabs = $('ul.expedition-advantages > li');

            function openAll() {
                allTabs.addClass('active');
                console.log('msg')
            }

            function closeAll() {
                allTabs.removeClass('active');
            }

            openAllBtn.on('click', openAll);
            closeAllBtn.on('click', closeAll);
        }
    }


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

    $('.upload_file, .choose_btn').on('click', function(){
      $(this).parent().find('input.file.optional').click()
    })

    function getFilePasportName() {
      var file = $('#passport_image');
      if ($(file)[0].files.length > 0) {
        $($('#passport_img')[0]).text($(file)[0].files[0].name);
      }
    };

    function getFileVisaName() {
      var file = $('#passport_visa');
      if ($(file)[0].files.length > 0) {
        $($('#visa_img')[0]).text($(file)[0].files[0].name);
      }
    };

    window.getFilePasportName = getFilePasportName;
    window.getFileVisaName = getFileVisaName;

    $("#user_update_form").submit(function(e) {
      $.ajax({
        url: "/dashboard/update_details",
        type: "PUT",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData:false,
        statusCode: {
          204: function() {
            success_message('Success');
          },
          422: function() {
            error_message('Error');
          }
        }
      });
    });
  }
});

