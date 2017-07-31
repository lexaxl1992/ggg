class PicturesController < ApplicationController
	def show
		@picture = Picture[params[:id]]
	end

	def new
		respond_to do |format|
			format.js
		end
	end

	def create
		uploadedFile = params[:file]
		new_fileName = Digest::CRC32.hexdigest(uploadedFile.original_filename)+".png"
		File.open(Rails.root.join('public', 'uploads', 'items', 'pictures', new_fileName), 'wb') do |file|
			file.write(uploadedFile.read)
		end

		@picture = Picture.create("url": "/uploads/items/pictures/"+new_fileName)

		respond_to do |format|
			if @picture.save
				format.js
			else
				format.html {notice:$custom_error_msg}
			end
		end
	end

	def destroy
		@picture_id = params[:id]
		@picture = Picture[@picture_id]
		@picture.delete
		respond_to do |format|
			if @picture.delete
				format.js
			else
				format.html {notice:"При удалении данных произошла ошибка."}
			end
		end
	end
end
