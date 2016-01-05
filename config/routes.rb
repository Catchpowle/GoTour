Rails.application.routes.draw do
  devise_for :artists
  devise_for :fans
  resources :fans, only: [:show]
  resources :artists, only: [:show]
  root to: "home#index"

end
