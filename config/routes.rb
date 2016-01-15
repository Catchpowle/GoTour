Rails.application.routes.draw do
  root to: "home#index"
  devise_for :artists, controllers: { registrations: "registrations" }
  devise_for :fans, controllers: { omniauth_callbacks: "fans/omniauth_callbacks", registrations: "registrations" }
  resources :fans, only: [:show]
  resources :artists, only: [:show] do
    collection do
      get :search
    end
    member do
      get :route
      post :plot
    end
  end
  resources :requests, only: [:create, :destroy]
end
