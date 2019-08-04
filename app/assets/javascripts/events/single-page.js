function get_more_photos(endpoint, take) {
  let len_record = $('.record').length;
  $.ajax({
    type: "GET",
    url: endpoint,
    data: { offset: len_record, take: take },
    dataType: "script",
    success() {
      $('.loading-gif').hide();
      $('.load-more').show();
    }
  })
}

jQuery(document).ready(function($) {
  // Intro carousel
  var introCarousel = $("#introCarousel");
  introCarousel.find(".carousel-inner").children(".item").each(function(index) {
    $(this).css("background-image", "url('" + $(this).children('.carousel-background').children('img').attr('src') +"')");
    $(this).css("background-size", 'cover');
    
    $(this).children('.carousel-background').remove();
  });

  // when the load more link is clicked
  $('a.load-more').click(function(e){
    e.preventDefault();

    $('.load-more').hide();
    $('.loading-gif').show();

    get_more_photos($(this).data("source"), $(this).data("take"))
  });

  // Initialize Venobox
  $('.venobox').venobox({
    bgcolor: '',
    overlayColor: 'rgba(6, 12, 34, 0.85)',
    closeBackground: '',
    closeColor: '#fff'
  });
});
