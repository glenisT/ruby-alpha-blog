Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  
  resources :articles
  
  get "signup", to: "users#new"
  resources :users, except: [:new] 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout' => :destroy, to: 'sessions#destroy'

  get 'destroy_user' => :destroy, to: 'sessions#destroy_user'
  end