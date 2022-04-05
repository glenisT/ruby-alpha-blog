Rails.application.routes.draw do
  root "pages#home"   #root page is received from pages_controller 'home' method/action 
  get "about", to: "pages#about"    #for other pages
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] gets only the specified paths related to the Article CRUD (check 'rails routes --expanded' command in terminal)
  resources :articles
end
