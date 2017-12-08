# Controller of phone number in site header
class PhoneNumberController < ApplicationController
  def update
    PhoneNumber.create("string": '8 918 145 1090') if PhoneNumber[1].nil?
    @phone_number = PhoneNumber[1]
    @phone_number.update("string": params[:phone_number])
  end
end
