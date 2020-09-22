Rails.application.routes.draw do

  get '/products/owned', to: 'products#owned', as: :owned_products
  get '/profile', to: 'pages#profile'

  devise_for :users

  resources :products
  resources :orders


  root to: 'pages#home'

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
