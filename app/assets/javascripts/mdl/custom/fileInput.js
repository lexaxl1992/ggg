function init_fileInput() {
	var fileInputTextDivs = document.getElementsByClassName("file_input_text_div"); var num
	for (num = 0; num < fileInputTextDivs[num].length; ++num) {
		var fileInput = fileInputTextDivs[num].parentNode.getElementsByTagName('input')[0]
		var fileInputText = fileInputTextDivs[num].getElementsByTagName('input')[0]
		fileInput.addEventListener('change', function(){
		  var str = fileInput.value; var i
		  if (str.lastIndexOf('\\')) {i = str.lastIndexOf('\\') + 1}
		  else if (str.lastIndexOf('/')) {i = str.lastIndexOf('/') + 1}
		  fileInputText.value = str.slice(i, str.length)
		})
		fileInput.addEventListener('change', function(){
			if (fileInputText.value.length != 0) {if (!fileInputTextDivs[num].classList.contains("is-focused")) {fileInputTextDivs[num].classList.add('is-focused')} }
			else {if (fileInputTextDivs[num].classList.contains("is-focused")) {fileInputTextDivs[num].classList.remove('is-focused')}}
		})
	}
}
