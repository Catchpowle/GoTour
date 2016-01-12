class Artist < User
  has_many :requests
  has_many :fans, through: :requests
end