$(function() {
  $(document).on("click", "[data-link]", function(e) {
    window.location.href = $(this).data("link");
  });
});
