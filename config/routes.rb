Rails.application.routes.draw do
  root "pages#home"   #root page is received from pages_controller 'home' method/action 
  get "about", to: "pages#about"    #for other pages
end
