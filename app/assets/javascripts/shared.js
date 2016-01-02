$(function() {
  $("[data-link]").click(function(e) {
    window.location.href = $(this).data("link");
  });
});
