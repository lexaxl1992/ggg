# Controller for site pages
class MainController < ApplicationController
  def index
    @items = Item.all
    @about_block = AboutBlock[1]
    render 'index'
  end

  def constructor; end
end
