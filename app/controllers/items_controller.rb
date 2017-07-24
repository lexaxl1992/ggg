class ItemsController < ApplicationController
  def show
    @item = Item[params[:id]]
  end

	def new
		respond_to do |format|
			format.js
		end
	end

	def edit
		@item = Item[params[:id]]
		respond_to do |format|
			format.js
		end
	end

	def create
		@item = Item.create(params[:item])
		@item.update(category: Category[params[:category_id][0]])
		respond_to do |format|
			if @item.save
				format.js
			else
				format.html {notice:$default_error_msg}
			end
		end
	end

	def update
		@item = Item[params[:item_id][0]]
		@item.update(params[:item])
		respond_to do |format|
			if @item.save
				format.js
			else
				format.html {notice:$default_error_msg}
			end
		end
	end

	def destroy
		@item = Item[params[:id]]
		@item.delete
		respond_to do |format|
			if @item.delete
				format.js
			else
				format.html {notice:$default_error_msg}
			end
		end
	end
end
