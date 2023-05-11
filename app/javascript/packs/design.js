$(document).ready(function(){
  $("#show-limit").on("change", function(){
    $(this).closest("form").trigger("submit");
  });

  $(".logo").on("click", function() {
    window.location.href = "/";
  })

  $("#edit-profile").on("click", function() {
    window.location.href = "/users/edit";
  })

  $(".avatar").on("click", function() {
    window.location.href = "/profile/me";
  })
});
