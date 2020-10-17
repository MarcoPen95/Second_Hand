Rails.application.routes.draw do
  resources :orders
  get 'favorites/update'
  resources :transactions
  resources :carts
  resources :announcements
  devise_for :sellers, path: 'sellers', controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: "sellers/registrations",sessions: "sellers/sessions"}
  devise_for :buyers, path: 'buyers', controllers: { registrations: "buyers/registrations",sessions: "buyers/sessions"}
  
  #home routes
  root 'home#index'
  get 'announcements/search' , to:'announcement#search'

  resources :searches

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end



  #buyer route
  get '/buyer/home', to: 'buyer#home'
  get '/buyer/my_transactions', to: 'buyer#my_transactions'
  get '/buyer/my_favorites', to: 'buyer#my_favorites'
  get '/buyer/my_messages', to: 'chat#index'




  #seller route
  get '/seller/home', to: 'seller#home'
  get '/seller/profile', to: 'seller#profile'
  get '/seller/my_objects', to: 'seller#my_objects'
  get '/seller/my_messages', to: 'chat#index'
  get '/seller/my_orders', to: 'seller#my_orders'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
