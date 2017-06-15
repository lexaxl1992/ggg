document.addEventListener('turbolinks:load',
	function bindSlider(){
		$('.itemSlider').slick({
			dots: true,
	    prevArrow: false,
	    nextArrow: false,
			speed: 400,
			slidesToShow: 5,
			slidesToScroll: 5,
			responsive: [
				{
					breakpoint: 1140,
					settings: {
						slidesToShow: 4,
						slidesToScroll: 4,
						infinite: true,
					}
				},
				{
					breakpoint: 910,
					settings: {
						slidesToShow: 3,
						slidesToScroll: 3,
						infinite: true,
					}
				},
				{
					breakpoint: 660,
					settings: {
						slidesToShow: 2,
						slidesToScroll: 2,
					}
				},
				{
					breakpoint: 430,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
					}
				}
			]
		})
	}
)