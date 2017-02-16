Rails.application.routes.draw do
  
  #get 'users/new'

  resources :categories do
    resources :messages
  end
  root 'categories#index'
  get '/about', to: 'categories#about'
  get '/signup', to: 'users#new'
end
