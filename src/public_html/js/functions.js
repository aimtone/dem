
;(function ($) {
$('#main').smoothState({
  loadingClass: 'is-loading',
  onReady: {
    duration: 0,
    // `$container` is a `jQuery Object` of the the current smoothState container
    // `$newContent` is a `jQuery Object` of the HTML that should replace the existing container's HTML.
    render: function ($container, $newContent) {
      // Update the HTML on the page
      $container.html($newContent);
    }
  }
});
})(jQuery);