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

  // when the page is ready for manipulation
  $(document).ready(function(){
    // when the load more link is clicked
    $('a.load-more').click(function(e){

      // prevent the default click action
      e.preventDefault();

          // hide load more link
          $('.load-more').hide();

          // show loading gif
          $('.loading-gif').show();

      // get the last id and save it in a variable 'last-id'
          var len_record = $('.record').length;
          // make an ajax call passing along our last user id
          $.ajax({

            // make a get request to the server
              type: "GET",
              // get the url from the href attribute of our link
              url: $(this).attr('created_at'),
              // send the last id to our rails app
              data: {total: len_record},
              // the response will be a script
              dataType: "script",

              // upon success 
              success: function(){
                  // hide the loading gif
                  $('.loading-gif').hide();
                  // show our load more link
                  $('.load-more').show();
              }

          });


    });

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