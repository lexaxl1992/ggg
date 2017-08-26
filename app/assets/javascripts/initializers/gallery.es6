let open_gallery = (event) => {
	let options = {
		"index": 0, // start at first slide
		"history": false
	};

	let windowID = 'show_item_' + event.target.dataset.itemId
	let pswpElement = document.querySelectorAll('.pswp')[0]
	let gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options)

	document.getElementById(windowID).close()
	gallery.init()

	gallery.listen('close', function() {
		document.getElementById(windowID).showModal()
	});

	var slideDownloadButton = new Vue({
		el: '#download-slide',
		data: {
			slideID: gallery.currItem.src
		}
	});

	gallery.listen('afterChange', function() {
		slideDownloadButton.slideID = gallery.currItem.src
	});

}
