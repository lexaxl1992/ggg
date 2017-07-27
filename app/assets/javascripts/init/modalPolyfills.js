function init_modalPolyfills() {
	var i; for (i = 0; i < document.getElementsByClassName('modal_window').length; ++i) {
		dialogPolyfill.registerDialog(document.getElementsByClassName('modal_window')[i])
	}
	// close modal on backdrop click
	document.getElementById("event_handler").onclick = function(event) {
		if (event.target.classList.contains("mdl-dialog")) {event.target.remove()}
	}
}
