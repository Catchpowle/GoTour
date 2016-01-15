class Artist < User
  has_many :requests
  has_many :fans, through: :requests

  def top_ten_cities
    self.fans.group(:city).count.sort_by{|k, v| v}.reverse.first(10)
  end

  def json_cities(start, finish, num)
    cities = {}
    cities[:start] = start
    cities[:finish] = finish
    top_cities = grouped_fans.sort_by{|k, v| v}.reverse.first(num)
    top_cities_location = location_strings(top_cities)
    top_cities_location.delete(start)
    top_cities_location.delete(finish)
    cities[:waypoints] = top_cities_location
    cities.to_json
  end

  def all_cities
    location_strings(grouped_fans)
  end

  def city_count
    grouped_fans.keys.count
  end

  def fans_city(fan)
    city = []
    city << fan.city
    city << self.fans.where(city: fan.city).count
  end

  private
  def grouped_fans
    self.fans.group([:city, :country]).count
  end

  def location_strings(grouped_fans)
    grouped_fans.map{|x|"#{x[0][0]}, #{x[0][1]}"}
  end
end