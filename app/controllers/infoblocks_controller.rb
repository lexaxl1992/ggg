class InfoblocksController < ApplicationController
  @@errno = { ok: false, status: 404 }.to_json
  @@ok = { ok: true }

  def show
    @infoblock = Infoblock[params[:id]]
    if @infoblock
      render json: @infoblock.attributes.merge!(@@ok).to_json
    else
      render json: @@errno
    end
  end

  def update
    Infoblock.create("html": '') if Infoblock[params[:id]].nil?
    @infoblock = Infoblock[params[:id]]
    @infoblock.update("html": params[:html])
  end
end
