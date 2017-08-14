let init_smoothScroll = () => {
	$('.scrollLink').on('click', (event) => {
	  $.smoothScroll({
	    scrollElement: $('main'),
	    scrollTarget: $('#'+event.currentTarget.id.substring(3))
	  });
	  return false;
	})
}
