class SpecsController < ApplicationController
  def create; end

  def update; end

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
