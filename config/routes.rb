Rails.application.routes.draw do
  root to: "home#index"
  devise_for :artists
  devise_for :fans, :controllers => { :omniauth_callbacks => "fans/omniauth_callbacks" }
  resources :fans, only: [:show]
  resources :artists, only: [:show] do
    collection do
      get :search
    end
  end
end
