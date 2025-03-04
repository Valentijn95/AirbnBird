Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

   get 'birds/:id', to: 'birds#show', as: 'bird'
end
