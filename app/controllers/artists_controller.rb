class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
    @cities = @artist.top_ten_cities
    @fans_json = @artist.fans.to_json(only: %i(name avatar city country latitude longitude))
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

  def route   
    @artist = Artist.find(params[:id])
    @total_fans = [*1..@artist.city_count]
    @cities = @artist.all_cities
  end

  def plot
    @artist = Artist.find(params[:id])
    route = params[:route]
    @waypoints_json = @artist.json_cities(route[:start], route[:finish], route[:total_cities].to_i)
  end
end
