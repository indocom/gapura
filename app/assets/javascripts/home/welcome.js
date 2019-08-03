function get_more_photos(endpoint, take) {
  console.log("Fetching more photos!!!");
  console.log(`The endpoint is ${endpoint}`);
  var len_record = $('.record').length;

  $.getJSON(endpoint, { offset: len_record, take: take }, function(response) {
    console.log(response.more_photos);
    console.log(response.gallery_photos);

    $('.loading-gif').hide();
    if (response.more_photos) {
      $('.load-more').show();
    } else {
      $('.load-more-container').hide();
    }
  });
}

jQuery(document).ready(function($) {
  // Real view height for mobile devices
  if (window.matchMedia("(max-width: 767px)").matches) {
    $('#intro').css({ height: $(window).height() });
  }

  // Testimonials carousel (uses the Owl Carousel library)
  $(".testimonials-carousel").owlCarousel({
    autoplay: true,
    dots: true,
    loop: true,
    responsive: {
      0: {
        items: 1
      },
      768: {
        items: 2
      },
      900: {
        items: 3
      }
    }
  });

  // when the load more link is clicked
  $('a.load-more').click(function(e){
    console.log("I'm clicked")
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

  // Buy tickets select the ticket type on click
  $('#buy-ticket-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var ticketType = button.data('ticket-type');
    var modal = $(this);
    modal.find('#ticket-type').val(ticketType);
  })

  // Smooth scroll for the menu and links with .scrollto classes
  $('.nav-menu a, #mobile-nav a, .scrollto').on('click', function () {
    console.log("event triggered");
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      if (target.length) {
        var top_space = 0;

        if ($('#header').length) {
          top_space = $('#header').outerHeight();

          if (!$('#header').hasClass('header-fixed')) {
            top_space = top_space - 20;
          }
        }

        $('html, body').animate({
          scrollTop: target.offset().top - top_space
        }, 1500, 'easeInOutExpo');

        if ($(this).parents('.nav-menu').length) {
          $('.nav-menu .menu-active').removeClass('menu-active');
          $(this).closest('li').addClass('menu-active');
        }

        if ($('body').hasClass('mobile-nav-active')) {
          $('body').removeClass('mobile-nav-active');
          $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
          $('#mobile-body-overlay').fadeOut();
        }
        return false;
      }
    }
  });
});
