function bind_modals() {
	var edit_category_buttons = document.getElementsByClassName('edit_category')
	var i; for (i = 0; i < edit_category_buttons.length; ++i) {
		edit_category_buttons[i].addEventListener('click', function(event) {
			var dialog = event.currentTarget.parentNode.parentNode.parentNode.getElementsByTagName('dialog')[0]
			dialog.showModal();
		})
	}
}

bind_modals(); document.addEventListener('turbolinks:load', bind_modals)

