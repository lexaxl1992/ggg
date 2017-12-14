class SpecsController < ApplicationController
  def create
    @spec = Spec.create(params[:spec])
    # and certainly "item":"[item_id]" in params[:spec]
    respond_to do |format|
      if @spec.save
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  def update
    @spec = Spec[params[:id]]
    @spec.update(params[:patch])
    respond_to do |format|
      if @spec.save
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  def destroy
    @spec = Spec[params[:id]]
    @spec.delete
    respond_to do |format|
      if @spec.delete
        format.js
      else
        format.js { render 'error' }
      end
    end
  end
end
