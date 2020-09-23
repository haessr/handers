Rails.application.routes.draw do

  get '/profile', to: 'pages#profile'
  get '/profile/:id', to: 'pages#profile'

  devise_for :users

  resources :orders, only: [:index, :show, :create, :edit, :update] do
    resources :payments, only: :new
  end

  resources :npos

  resources :products do
    resources :reviews, only: [:new, :create, :index]
  end


  root to: 'pages#home'

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
