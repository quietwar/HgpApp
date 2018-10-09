// require index_as_calendar/application
//require jquery-ui

$(document).ready(function() {
  jQuery('input.hasDatetimePicker').datetimepicker({
    dateFormat: "dd/mm/yy",
    beforeShow: function () {
      setTimeout(
        function () {
          $('#ui-datepicker-div').css("z-index", "3000");
        }, 100
      );
    }
  });
});

$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
