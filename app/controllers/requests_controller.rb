class RequestsController < ApplicationController
  def create
    @request = Request.create!(artist_id: params[:artist], fan_id: current_fan.id)
  end

  def destroy
    @request = Request.find(params[:id])
    @artist_id = @request.artist_id
    @request.destroy!
  end
end
