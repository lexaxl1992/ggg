class ImagesController < ApplicationController
  def create
    if params[:file]
      file = params[:file]

      case file.content_type
      when 'image/jpeg'
        file_ext = '.jpg'
      when 'image/png'
        file_ext = '.png'
      when 'image/gif'
        file_ext = '.gif'
      else
        file_ext = '.undefined'
      end

      filename = Digest::CRC32.hexdigest(Random.rand(1..10_000).to_s) + file_ext
      url = "/uploads/images/#{filename}"
      filepath = "/public#{url}"

      File.open(Rails.root.to_s + filepath, 'wb') do |new_file|
        new_file.write(file.read)
      end
      image_size = FastImage.size(File.open(Rails.root.to_s + filepath))

      @image_props = {
        "url": url,
        "filepath": filepath,
        "width": image_size[0],
        "height": image_size[1],
        "caption": params[:caption]
      }

      @image_props[:slider_id] = params[:slider_id]
      @image = Image.create(@image_props)
      respond_to do |format|
        format.js if @image.save
      end

    else
      respond_to do |format|
        format.js { render 'error' }
      end
    end
  end

  def update
    if params[:file]
      file = params[:file]

      case file.content_type
      when 'image/jpeg'
        file_ext = '.jpg'
      when 'image/png'
        file_ext = '.png'
      when 'image/gif'
        file_ext = '.gif'
      else
        file_ext = '.undefined'
      end

      filename = Digest::CRC32.hexdigest(Random.rand(1..10_000).to_s) + file_ext
      url = "/uploads/images/#{filename}"
      filepath = "/public#{url}"

      File.open(Rails.root.to_s + filepath, 'wb') do |new_file|
        new_file.write(file.read)
      end
      image_size = FastImage.size(File.open(Rails.root.to_s + filepath))

      @image_props = {
        "url": url,
        "filepath": filepath,
        "width": image_size[0],
        "height": image_size[1],
        "caption": params[:caption]
      }

      @image = Image[params[:id]].update(@image_props)
      respond_to do |format|
        format.js if @image.save
      end

    else
      respond_to do |format|
        format.js { render 'error' }
      end
    end
  end

  def destroy
    @image_id = params[:id]
    @image = Image[@image_id]
    File.delete(Rails.root.to_s + @image.filepath) if @image.filepath
    @image.delete
    respond_to do |format|
      format.js	if @image.delete
    end
  end
end
