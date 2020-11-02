Rails.application.routes.draw do
  resources :orders
  get 'favorites/update'
  resources :purchases
  
  resources :announcements
  devise_for :sellers, path: 'sellers', controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: "sellers/registrations",sessions: "sellers/sessions"}
  devise_for :buyers, path: 'buyers', controllers: { registrations: "buyers/registrations",sessions: "buyers/sessions", omniauth_callbacks: "buyers/omniauth_callbacks"}
  
  #home routes
  root 'home#index'
  get 'announcements/search' , to:'announcement#search'
  get '/about', to: 'home#about'

  resources :searches

 

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end



  #buyer route
  get '/buyer/home', to: 'buyer#home'
  get '/buyer/profile', to: 'buyer#profile'
  get '/buyer/my_purchases', to: 'buyer#my_purchases'
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
