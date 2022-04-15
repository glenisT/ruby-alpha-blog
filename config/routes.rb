Rails.application.routes.draw do
  root "pages#home" #root page is received from pages_controller 'home' method/action 
  get "about", to: "pages#about" #for other pages

  resources :articles
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] gets only the specified paths related to the Article CRUD (check 'rails routes --expanded' command in terminal)

  get "signup", to: "users#new"
  resources :users, except: [:new] #except new because it is already defined above

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout' => :destroy, to: 'sessions#destroy'
  get 'delete_user' => :destroy, to: 'sessions#delete'
end
