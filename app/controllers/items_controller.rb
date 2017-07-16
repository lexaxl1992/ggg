class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

	def new
		respond_to do |format|
			format.js
		end
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def create

	end

	def update

	end

	def destroy

	end
end
