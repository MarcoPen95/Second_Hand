Rails.application.routes.draw do
  resources :transactions
  resources :carts
  resources :announcements
  devise_for :sellers, path: 'sellers', controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: "sellers/registrations",sessions: "sellers/sessions"}
  devise_for :buyers, path: 'buyers', controllers: { registrations: "buyers/registrations",sessions: "buyers/sessions"}
  
  #home routes
  root 'home#index'
  get 'announcements/search' , to:'announcement#search'

  resources :searches


  #buyer route
  get '/buyer/home', to: 'buyer#home'
  get '/buyer/my_transactions', to: 'buyer#my_transactions'



  #seller route
  get '/seller/home', to: 'seller#home'
  get '/seller/my_objects', to: 'seller#my_objects'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
