class ImagesetsController < ApplicationController
  def show
    @imageset = Imageset[params[:id]]
  end

  def edit
    @imagesetId = params[:id]
    @imageset = Imageset[@imagesetId]
    @current_value = ''
    case params[:caption_to]
    when 'photo'
      @current_value = @imageset.photoCaption if @imageset.photoCaption
    when 'picture'
      @current_value = @imageset.pictureCaption if @imageset.pictureCaption
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    if params[:objects] || !params[:objects].values.join.empty?
      @imageset_props = {}
      @imageset_props[:item_id] = params[:item_id] if params[:item_id]
      params[:objects].each_pair do |type, object|
        unless object.is_a? String
          case object.content_type
          when 'image/jpeg'
            file_extension = '.jpg'
          when 'image/png'
            file_extension = '.png'
          when 'image/gif'
            file_extension = '.gif'
          else
            file_extension = '.undefined'
          end
          new_filename = Digest::CRC32.hexdigest(Random.rand(1..10_000).to_s) + file_extension
          File.open(Rails.root.join('public', 'uploads', 'items', type + 's', new_filename), 'wb') do |new_file|
            new_file.write(object.read)
          end
          imageSize = FastImage.size(File.open(Rails.root.to_s + '/public/uploads/items/' + type + 's/' + new_filename))
          @imageset_props.merge!(
            "#{type}Url": '/uploads/items/' + type + 's/' + new_filename,
            "#{type}FilePath": '/public/uploads/items/' + type + 's/' + new_filename,
            "#{type}Width": imageSize[0],
            "#{type}Height": imageSize[1],
            "#{type}Caption": params[:objects]["#{type}_caption".to_sym]
          )
        end
      end
      @imageset = Imageset.create(@imageset_props) unless @imageset_props.nil?
      @window_id = params[:window_id]
      respond_to do |format|
        format.js if @imageset.save
      end
    else
      respond_to do |format|
        format.js { render 'error' }
      end
    end
  end

  def update
    @imagesetId = params[:id]
    @imageset = Imageset[@imagesetId]
    params[:data]&.each_pair do |type, text|
      @imageset.update("#{type}": text)
    end
    respond_to do |format|
      if @imageset.save
        format.js
      end
    end
  end

  def destroy
    @imagesetId = params[:id]
    @imageset = Imageset[@imagesetId]
    File.delete(Rails.root.to_s + @imageset.photoFilePath) if @imageset.photoFilePath
    File.delete(Rails.root.to_s + @imageset.pictureFilePath) if @imageset.pictureFilePath
    @imageset.delete
    respond_to do |format|
      format.js	if @imageset.delete
    end
  end
end
