Rails.application.routes.draw do
  root to: "birds#index"
  devise_for :users

  resources :birds do
  end

  resources :bookings, only: [:index, :show, :create, :update, :destroy]

  get "dashboard", to: "pages#dashboard", as: 'dashboard'

end
