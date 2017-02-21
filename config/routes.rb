Rails.application.routes.draw do
  
  resources :categories do
    resources :messages
  end
  resources :users
  root 'categories#index'
  get '/about', to: 'categories#about'
  get '/signup', to: 'users#new'
end
