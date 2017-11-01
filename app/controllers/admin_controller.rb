# Adminpanel controller
class AdminController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'f2fd272c'

  def index
    if Infoblock[1]
      @bottom_infoblock_content = Infoblock[1].html
    else
      @bottom_infoblock_content = ''
    end
    render layout: 'layouts/managment'
  end
end
