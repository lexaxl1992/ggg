function bind_polyfills() {
	var i; for (i = 0; i < document.getElementsByClassName('modal_window').length; ++i) {
		dialogPolyfill.registerDialog(document.getElementsByClassName('modal_window')[i])
	}
}
