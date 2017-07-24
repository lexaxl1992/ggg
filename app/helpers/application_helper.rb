module ApplicationHelper
	$default_error_msg = "При совершении операции произошла ошибка. Попробуйте повторить операцию позже"

	def to_bool(str)
		str == 'true' || str == '1'
	end
end
