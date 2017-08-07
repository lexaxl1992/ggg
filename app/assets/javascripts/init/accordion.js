function init_accordion() {
	$("#catalogue").collapsible()
	function adapt() {
		var i, headers = document.getElementsByClassName('adaptive_header')
		for (i = 0; i < headers.length; ++i) {
			if (document.documentElement.clientWidth > 1023) {
				if (headers[i].classList.contains('collapsible-header')) {
					headers[i].classList.remove('collapsible-header')
					headers[i].classList.add('static-header')
				}
			} else {
				if (headers[i].classList.contains('static-header')) {
					headers[i].classList.remove('static-header')
					headers[i].classList.add('collapsible-header')
				}
			}
	}}
	adapt(); window.addEventListener('resize', adapt)
}
