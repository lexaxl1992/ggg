document.addEventListener('turbolinks:load',
	function bindSlider(){
		$('.owl-carousel').owlCarousel({
			loop: true,
			margin: 0,
			dots: true,
			responsiveClass: true,
			responsive:{
				0: {
					items: 1,
					
				},
				420: {
					items: 2
				},
				660: {
					items: 3
				},
				920: {
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
)
