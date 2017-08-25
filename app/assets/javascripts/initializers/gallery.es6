let open_gallery = () => {
	var pswpElement = document.querySelectorAll('.pswp')[0];

	// define options (if needed)
	var options = {
		"index": 0, // start at first slide
		"history": false
	};

	// Initializes and opens PhotoSwipe
	var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
	gallery.init();
}
