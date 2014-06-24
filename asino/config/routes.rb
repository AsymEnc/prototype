Rails.application.routes.draw do
  resources :documents

  devise_for :users
  root 'static_pages#main'
  match('/help', {:to => 'static_pages#help', :via => 'get'})
  match('/about', {:to => 'static_pages#about', :via => 'get'})
  
  #get 'static_pages/main'

  #get 'static_pages/help'

  #get 'static_pages/about'

end
