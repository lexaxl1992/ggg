let init_sliders = () => {
	$("#slider").slick({dots: true})
	$('.owl-carousel').owlCarousel({
		lazyLoad: true,
		margin: 0,
		nav: true,
		dots: true,
		autoHeight: true,
		responsiveClass: true,
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
	})
}
