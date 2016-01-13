class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
    @cities = @artist.top_ten_cities
    if current_fan
      @request = Request.where(artist: @artist, fan: current_fan).first
      @fans_city = @artist.fans_city(current_fan)
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
