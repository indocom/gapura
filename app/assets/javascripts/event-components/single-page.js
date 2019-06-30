jQuery(document).ready(function($) {
  // Intro carousel
  var introCarousel = $("#introCarousel");
  introCarousel.find(".carousel-inner").children(".item").each(function(index) {
    $(this).css("background-image", "url('" + $(this).children('.carousel-background').children('img').attr('src') +"')");
    $(this).children('.carousel-background').remove();
  });
  
  // Initialize Venobox
  $('.venobox').venobox({
    bgcolor: '',
    overlayColor: 'rgba(6, 12, 34, 0.85)',
    closeBackground: '',
    closeColor: '#fff'
  });
});
