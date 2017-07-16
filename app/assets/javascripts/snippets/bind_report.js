function bind_report() {
	document.body.addEventListener('ajax:error', function() {
		alert("При совершении операции произошла ошибка. Попробуйте повторить операцию позже")
	})
}
