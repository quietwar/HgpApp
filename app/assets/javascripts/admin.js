$(document).on("click", "#table-id tr", function() {
  var link  = $(this).data("href")
  $.ajax({
    url: link,
    type: "GET"
  });
});
