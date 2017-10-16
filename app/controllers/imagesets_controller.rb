class ImagesetsController < ApplicationController
	def show
		@imageset = Imageset[params[:id]]
	end

	def create
		unless params[:objects].nil?
			@imagesetParams = {}
			params[:objects].each_pair do |type, object|
				unless object.is_a? String
					case object.content_type
						when "image/jpeg"
							fileExtension = ".jpg"
						when "image/png"
							fileExtension = ".png"
						when "image/gif"
							fileExtension = ".gif"
						else
							fileExtension = ".undefined"
					end

					new_fileName = Digest::CRC32.hexdigest(Random.rand(1..10000).to_s) + fileExtension
					File.open(Rails.root.join('public', 'uploads', 'items', type+'s', new_fileName), 'wb') do |new_file|
						new_file.write(object.read)
					end

					imageSize = FastImage.size(File.open(Rails.root.to_s + "/public/uploads/items/"+type+"s/" + new_fileName))					
					@imagesetParams = @imagesetParams.merge(
						"#{type}Url":"/uploads/items/"+type+"s/" + new_fileName,
						"#{type}FilePath":"/public/uploads/items/"+type+"s/" + new_fileName,
						"#{type}Width": imageSize[0],
						"#{type}Height": imageSize[1]
					)

					if type == "photo"
						unless params[:objects][:photo_caption].nil?
							@imagesetParams = @imagesetParams.merge("#{type}Caption": params[:objects][:photo_caption])
						end
					elsif type == "picture"
						unless params[:objects][:picture_caption].nil?
							@imagesetParams = @imagesetParams.merge("#{type}Caption": params[:objects][:picture_caption])	
						end				
					end

				end
			end

			@imageset = Imageset.create(@imagesetParams) unless @imagesetParams.nil?
			respond_to do |format|
				format.js if @imageset.save	
			end

		else
			respond_to do |format|
				format.js {render "error"}
			end
		end
	end

	def update
		@imagesetId = params[:id]
		@imageset = Imageset[@imagesetId]
		unless params[:data].nil?
			params[:data].each_pair do |type, text|
				@imageset.update('#{type}Caption': text)
			end
		end

		respond_to do |format|
			if @imageset.save
				format.js
			else
				format.js {render "error"}
			end
		end
	end

	def destroy
		@imagesetId = params[:id]
		@imageset = Imageset[@imagesetId]
		@imageset.delete
		File.delete(Rails.root.to_s + @imageset.photoFilePath) unless @imageset.photoFilePath.nil?
		File.delete(Rails.root.to_s + @imageset.pictureFilePath) unless @imageset.pictureFilePath.nil?
		respond_to do |format|
			format.js	if @imageset.delete
		end
	end

end