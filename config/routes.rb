Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  get "/", to:"pages#home"

end
