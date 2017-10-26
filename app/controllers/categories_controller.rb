class CategoriesController < ApplicationController
  def show
    @category = Category[params[:id]]
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def edit
    @category = Category[params[:id]]
    respond_to do |format|
      format.js
    end
  end

  def create
    props = params[:category].merge(
      "index": Digest::CRC32.hexdigest(params[:category][:label])
    )
    if props[:icon]
      uploaded_file = props[:icon]
      File.open(Rails.root.join('public', 'uploads', 'categories', props[:index] + '.png'),'wb') do |file|
        file.write(uploaded_file.read)
      end
      props.merge!(
        "icon": '/uploads/categories /' + props[:index] + '.png'
      )
    end

    @category = Category.create(props)

    respond_to do |format|
      if @category.save
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  def update
    @category = Category[params[:categoryId]]
    props = params[:category]
    if props[:icon]
      uploaded_file = props[:icon]
      File.open(Rails.root.join('public', 'uploads', 'categories', @category.index + '.png'), 'wb') do |file|
        file.write(uploaded_file.read)
      end
      props.merge!(
        "icon": '/uploads/categories/' + @category.index + '.png'
      )
    end
    @category.update(props)
    respond_to do |format|
      if @category.save
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  def destroy
    @category = Category[params[:id]]
    @category_index = @category.index
    @category.items.each do |item|
      item.imagesets.each do |imageset|
        File.delete(Rails.root.to_s + imageset.photoFilePath) if imageset.photoFilePath
        File.delete(Rails.root.to_s + imageset.pictureFilePath) if imageset.pictureFilePath
        imageset.delete
      end
      item.delete
    end
    @category.delete
    respond_to do |format|
      if @category.delete
        format.js
      else
        format.js { render 'error' }
      end
    end
  end
end
