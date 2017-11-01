# Controller for site pages
class MainController < ApplicationController
  def index
    @items = Item.all
    render 'index'
  end

  def constructor; end
end
