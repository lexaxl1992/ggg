let bind_ajaxReports = () => {
	document.body.addEventListener('ajax:error', () => {
		alert("При совершении операции произошла ошибка. Попробуйте повторить операцию позже.")
	})
}
