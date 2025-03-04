Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/update'
  get 'bookings/destroy'
  root to: "pages#home"
  devise_for :users

   get 'birds/:id', to: 'birds#show', as: 'bird'
end
