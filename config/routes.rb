Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/update'
  get 'bookings/destroy'
  root to: "pages#home"
  devise_for :users
end
