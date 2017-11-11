class ItemsController < ApplicationController
  def show
    @item = Item[params[:id]]
    @galleryData = []
    @item.imagesets.each do |imageset|
      if imageset.photoUrl
        @galleryData.push(
          "src": imageset.photoUrl,
          "w": imageset.photoWidth,
          "h": imageset.photoHeight,
          "title": imageset.photoCaption
        )
      end
      if imageset.pictureUrl
        @galleryData.push(
          "src": imageset.pictureUrl,
          "w": imageset.pictureWidth,
          "h": imageset.pictureHeight,
          "title": imageset.pictureCaption
        )
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def new
    @window_id = 'Ox' + Digest::CRC32.hexdigest(Random.rand(1..10_000).to_s)
    respond_to do |format|
      format.js
    end
  end

  def edit
    @window_id = 'Ox' + Digest::CRC32.hexdigest(Random.rand(1..10_000).to_s)
    @item_id = params[:id]
    @item = Item[@item_id]
    respond_to do |format|
      format.js
    end
  end

  def create
    props = params[:item].merge(
      "name": params[:item][:name].mb_chars.upcase
    )
    unless props[:thumbnail].nil?
      new_fileName = Digest::CRC32.hexdigest(props[:name]) + '.png'
      uploaded_file = props[:thumbnail]
      File.open(Rails.root.join('public', 'uploads', 'items', 'thumbs', new_fileName), 'wb') do |file|
        file.write(uploaded_file.read)
      end
      props[:thumbnail] = '/uploads/items/thumbs/' + new_fileName
    end
    @item = Item.create(props)
    @item.update(category: Category[params[:categoryId]])
    if params[:imagesets]
      uid = 0
      params[:imagesets].each do |imageset_id|
        imageset = Imageset[imageset_id]
        imageset.update(item: @item)
        unless imageset.photoUrl.nil?
          imageset.update(photoUid: uid)
          uid += 1
        end
        unless imageset.pictureUrl.nil?
          imageset.update(pictudeUid: uid)
          uid += 1
        end
      end
    end
    respond_to do |format|
      if @item.save
        format.js
      else
        format.html { render action 'new', notice: $custom_error_msg }
      end
    end
  end

  def update
    props = params[:item].merge(
      "name": params[:item][:name].mb_chars.upcase
    )
    unless props[:thumbnail].nil?
      new_fileName = Digest::CRC32.hexdigest(params[:itemId]) + '.png'
      uploaded_file = props[:thumbnail]
      File.open(Rails.root.join('public', 'uploads', 'items', 'thumbs', new_fileName), 'wb') do |file|
        file.write(uploaded_file.read)
      end
      props[:thumbnail] = '/uploads/items/thumbs/' + new_fileName
    end
    @item = Item[params[:itemId]]
    @item.update(props)
    uid = 0
    @item.imagesets.each do |imageset|
      if imageset.photoUrl
        imageset.update(photoUid: uid)
        uid += 1
      end
      if imageset.pictureUrl
        imageset.update(pictureUid: uid)
        uid += 1
      end
    end

    respond_to do |format|
      if @item.save
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  def destroy
    @item_id = params[:id]
    @item = Item[@item_id]
    @categoryIndex = @item.category.index
    File.delete(Rails.root.to_s + "/public#{@item.thumbnail}") if @item.thumbnail
    @item.imagesets.each do |imageset|
      File.delete(Rails.root.to_s + imageset.photoFilePath) if imageset.photoFilePath
      File.delete(Rails.root.to_s + imageset.pictureFilePath) if imageset.pictureFilePath
      imageset.delete
    end
    @item.delete
    respond_to do |format|
      if @item.delete
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  def update_order
    i = 0
    params[:categories_order]&.each do |id|
      Category[id].update("position": i)
      i += 1
    end
    i = 0
    params[:items_order]&.each do |id|
      Item[id].update("position": i)
      i += 1
    end
  end
end
