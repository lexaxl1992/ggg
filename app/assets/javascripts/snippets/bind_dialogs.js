function call_dialog(event) {
	if (document.getElementById(event.target.dataset.for) == null) {
		var dialog = document.createElement('dialog')
		dialog.className = "mdl-dialog category_editor"
		dialog.id = event.target.dataset.for
		var hash = JSON.parse(document.getElementById(event.target.dataset.for.substr(5)).dataset.json)
		if (dialog.id == "edit_"+hash["label"])
			{dialog.innerHTML = /* получить с помощью j render */}
		else if (dialog.id == "new_item")
			{dialog.innerHTML = ""}
		document.getElementById('event_handler').appendChild(dialog)
		dialogPolyfill.registerDialog(dialog)
		componentHandler.upgradeDom()
	}
}

function bind_dialogs() {
	document.getElementById("event_handler").onclick = function(event) {
		if (event.target.classList.contains("call_dialog")) {
			document.getElementById(event.target.dataset.for).showModal();
		}
	}
}
