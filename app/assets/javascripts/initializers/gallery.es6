let open_gallery = (event) => {
	let windowId = 'show_item_' + event.target.dataset.itemId
	var pswpElement = document.querySelectorAll('.pswp')[0];

	// define options (if needed)
	var options = {
		"index": 0, // start at first slide
		"history": false
	};

	var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options)

	document.getElementById(windowId).close()
	gallery.init()

	gallery.listen('close', function() {
		document.getElementById(windowId).showModal()
	})
}
