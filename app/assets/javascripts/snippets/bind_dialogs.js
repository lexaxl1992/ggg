function bind_dialogs() {
	/*
	document.getElementById("event_handler").onclick = function(event) {
		if (event.target.classList.contains("call_dialog")) {
			document.getElementById(event.target.dataset.for).showModal();
		}
	}
	*/
	document.getElementById("event_handler").onclick = function(event) {
		if (event.target.classList.contains("mdl-dialog")) {event.target.remove()}
	}
}
