class ArtistsController < ApplicationController
  before_filter :find_artist, only: [:show, :route, :plot]

  def show
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
    @total_fans = [*1..@artist.city_count]
    @cities = @artist.all_cities
  end

  def plot
    route = params[:route]
    @waypoints_json = @artist.json_cities(route[:start], route[:finish], route[:total_cities].to_i)
  end

  private
  def find_artist
    @artist = Artist.find(params[:id])
  end

end
