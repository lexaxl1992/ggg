# Adminpanel controller
class AdminController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: '1234'

  def index
    @about_block = AboutBlock[1]
    render layout: 'layouts/managment'
  end
end
