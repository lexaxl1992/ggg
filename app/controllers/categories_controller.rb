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
    lambda = params[:category].merge(
      "index": Digest::CRC32.hexdigest(params[:category][:label])
    )

    unless lambda[:icon].nil?
      props = lambda
      uploaded_file = props[:icon]
      File.open(Rails.root.join('public', 'uploads', 'categories', props[:index] + '.png'),'wb') do |file|
        file.write(uploaded_file.read)
      end
      lambda = props.merge(
        "icon": '/uploads/categories /' + props[:index] + '.png'
      )
    end

    @category = Category.create(lambda)

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
    lambda = params[:category]

    unless lambda[:icon].nil?
      props = lambda
      uploaded_file = props[:icon]
      File.open(Rails.root.join('public', 'uploads', 'categories', @category.index + '.png'), 'wb') do |file|
        file.write(uploaded_file.read)
      end
      lambda = props.merge(
        "icon": '/uploads/categories/' + @category.index + '.png'
      )
    end

    @category.update(lambda)
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
    @category.delete
    respond_to do |format|
      if @category.delete
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  def update_order
    sd
  end
end
