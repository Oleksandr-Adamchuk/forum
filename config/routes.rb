Rails.application.routes.draw do
  root 'categories#index'
  resources :categories do
    resources :messages
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/about', to: 'categories#about'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  
  
end
