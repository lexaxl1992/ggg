# Adminpanel controller
class AdminController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'f2fd272c'

  def index
    @about_block = AboutBlock[1]
    render layout: 'layouts/managment'
  end
end
