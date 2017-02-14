Rails.application.routes.draw do
  
  resources :categories do
    resources :messages
  end
  root 'categories#index'
end
