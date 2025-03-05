Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :birds do
  end

  resources :bookings, only: [:index, :show, :create, :update, :destroy]

  get "dashboard", to: "pages#dashboard"
end
