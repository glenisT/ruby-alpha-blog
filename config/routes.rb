Rails.application.routes.draw do
  root "pages#home"   #root page is received from pages_controller 'home' method/action 
  get "about", to: "pages#about"    #for other pages
  resources :articles, only: [:show, :index, :new, :create] #gets all the paths related to the Article CRUD (in this case only SHOW)
end
