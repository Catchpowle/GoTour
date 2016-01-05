Rails.application.routes.draw do
  devise_for :artists
  devise_for :fans
  root to: "home#index"

end
