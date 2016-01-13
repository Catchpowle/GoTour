class Artist < User
  has_many :requests
  has_many :fans, through: :requests

  def top_ten_cities
    self.fans.group(:city).count.sort_by{|k, v| v}.reverse.first(10)
  end

  def fans_city(fan)
    city = []
    city << fan.city
    city << self.fans.where(city: fan.city).count
  end
end