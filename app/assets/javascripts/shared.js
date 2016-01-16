$(function() {
  $(document).on("click", "[data-link]", function(e) {
    if (!$(e.target).hasClass("non-linkable")) {
      window.location.href = $(this).data("link");
    }
  });
});
