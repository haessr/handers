Rails.application.routes.draw do

  get '/products/owned', to: 'products#owned', as: :owned_products
  get '/profile', to: 'pages#profile'

  devise_for :users

  resources :products
  resources :orders
  resources :npos

   resources :products do
    resources :reviews, only: [:new, :create, :index]
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
