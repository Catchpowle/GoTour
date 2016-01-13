class FansController < ApplicationController

  def show
    @fan = Fan.find(params[:id])
    @other_artist_list = Artist.where(id: current_fan.other_requested_artists.map(&:id))
  end

end
