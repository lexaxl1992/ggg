# Controller of "about" site block
class AboutBlockController < ApplicationController
  def show
    @about_block = AboutBlock[1]
  end

  def create
    AboutBlock.create("html":"empty") if AboutBlock[1].nil?
  end

  def update
    @about_block = AboutBlock[1]
    @about_block.update("html": params[:html])
  end
end
