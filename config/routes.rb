Rails.application.routes.draw do
  root to: "birds#index"
  devise_for :users

  resources :birds do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :show, :update, :destroy]

  get "dashboard", to: "pages#dashboard", as: 'dashboard'
end
