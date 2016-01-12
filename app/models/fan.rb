class Fan < User
  has_many :requests
  has_many :artists, through: :requests

  devise :omniauthable, :omniauth_providers => [:facebook]
end