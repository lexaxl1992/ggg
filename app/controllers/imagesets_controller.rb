class ImagesetsController < ApplicationController
	def show
		@imageset = Imageset[params[:id]]
	end

	def create
		unless params[:files] == nil
			@imagesetParams = {}
			params[:files].each_pair do |type, fileObject|
				case fileObject.content_type
					when "image/jpeg"
						fileExtension = ".jpg"
					when "image/png"
						fileExtension = ".png"
					when "image/gif"
						fileExtension = ".gif"
					else
						fileExtension = ".undefined"
				end

				new_fileName = Digest::CRC32.hexdigest(fileObject.original_filename) + fileExtension
				if type == "photo"
					File.open(Rails.root.join('public', 'uploads', 'items', 'photos', new_fileName), 'wb') do |new_file|
						new_file.write(fileObject.read)
					end
					@imagesetParams = @imagesetParams.merge(
						"photoUrl":"/uploads/items/photos/"+new_fileName,
						"photoFilePath":"/public/uploads/items/photos/"+new_fileName
					)
				elsif type == "picture"
					File.open(Rails.root.join('public', 'uploads', 'items', 'pictures', new_fileName), 'wb') do |new_file|
						new_file.write(fileObject.read)
					end
					@imagesetParams = @imagesetParams.merge(
						"pictureUrl":"/uploads/items/pictures/"+new_fileName,
						"pictureFilePath":"/public/uploads/items/pictures/"+new_fileName
					)
				end

				@imageset = Imageset.create(@imagesetParams) if @imagesetParams.length > 0
				respond_to do |format|
					format.js	if @imageset.save	
				end
			end

		else
			respond_to do |format|
				format.js {render "error"}
			end
		end
	end

	def destroy
		@imagesetId = params[:id]
		@imageset = Imageset[@imagesetId]
		File.delete(Rails.root.to_s + @imageset.photoFilePath)
		File.delete(Rails.root.to_s + @imageset.pictureFilePath)
		@imageset.delete
		respond_to do |format|
			format.js	if @imageset.delete
		end
	end
end
