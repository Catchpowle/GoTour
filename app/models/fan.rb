class Fan < User
  has_many :requests
  has_many :artists, through: :requests

  devise :omniauthable, :omniauth_providers => [:facebook]

  def other_requested_artists
    other_artist_list = []
    Artist.all.each do |a|
      if self.artists.exclude?(a)
        a.fans.each do |f|
          if f.geocode_string == self.geocode_string
            other_artist_list << a
            break
          end
        end
      end
    end
    other_artist_list
  end
end