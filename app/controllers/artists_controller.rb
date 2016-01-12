class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
    if current_fan
      @request = Request.where(artist: @artist, fan: current_fan).first
    end
  end

  def search
    @artists = Artist.where("name LIKE ?", "%#{params[:search]}%")

    respond_to do |format|
      format.json { render :json => @artists }
      format.html { redirect_to root_path(@artists) }
    end
  end

end
