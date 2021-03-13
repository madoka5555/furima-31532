Rails.application.routes.draw do
  get 'purchases/new'
  get 'purchases/create'
  devise_for :users
  root to: "items#index"
  resources :items, except: [:index]
  resources :purchases, only: [:index, :create]
end
