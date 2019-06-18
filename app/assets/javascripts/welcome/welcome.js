jQuery(document).ready(function ($) {
    // Header fixed on scroll
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#header').addClass('header-scrolled');
        } else {
            $('#header').removeClass('header-scrolled');
        }
    });

    if ($(window).scrollTop() > 100) {
        $('#header').addClass('header-scrolled');
    }

    // Real view height for mobile devices
    if (window.matchMedia("(max-width: 767px)").matches) {
        $('#intro').css({ height: $(window).height() });
    }

    // Initiate the wowjs animation library
    new WOW().init();

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

    // Buy tickets select the ticket type on click
    $('#buy-ticket-modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var ticketType = button.data('ticket-type');
        var modal = $(this);
        modal.find('#ticket-type').val(ticketType);
    })
});