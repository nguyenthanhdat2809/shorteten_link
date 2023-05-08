$(document).ready(function(){
  $("#show-limit").on("change", function(){
    $(this).closest("form").trigger("submit");
  });

  $(".logo").on("click", function() {
    window.location.href = "/";
  })
});
