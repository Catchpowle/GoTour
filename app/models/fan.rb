class Fan < User
  devise :omniauthable, :omniauth_providers => [:facebook]
end