function def_sliders() {
    $("#slider").slick({
        dots: true,
        adaptiveHeight: true,
        lazyLoad: 'ondemand'
    });
    $('.owl-carousel').owlCarousel({
        margin: 0,
        nav: true,
        dots: true,
        autoHeight: true,
        responsiveClass: true,
        touchThreshold: 3,
        responsive:{
            0: {
                items: 1
            },
            320: {
                items: 2
            },
            480: {
                items: 3
            },
            940: {
                items: 4
            },
            1280: {
                items: 5
            },
            1440: {
                items: 6
            }
        }
    });
}
