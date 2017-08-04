class ImagesController < ApplicationController
	def show
		@image = Image[params[:id]]
	end

	def create
		uploadedPhoto = params[:photo]

		case uploadedPhoto.content_type
			when "image/jpeg"
				fileExtension = ".jpg"
			when "image/png"
				fileExtension = ".png"
			when "image/gif"
				fileExtension = ".gif"
			else
				fileExtension = ".undefined"
		end

		new_fileName = Digest::CRC32.hexdigest(uploadedPhoto.original_filename) + fileExtension
		File.open(Rails.root.join('public', 'uploads', 'items', 'images', new_fileName), 'wb') do |file|
			file.write(uploadedPhoto.read)
		end

		@image = Image.create("url": "/uploads/items/images/"+new_fileName)
		@new_filePath = "/uploads/items/images/"+new_fileName
		@windowId = params[:windowId]

		respond_to do |format|
			if @image.save
				format.js
			else
				format.html {notice:$custom_error_msg}
			end
		end
	end

	def destroy
		@image_id = params[:id]
		@image = Image[@image_id]
		@image.delete
		respond_to do |format|
			if @image.delete
				format.js
			else
				format.html {notice:"При удалении данных произошла ошибка."}
			end
		end
	end
end
