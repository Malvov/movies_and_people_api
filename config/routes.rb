Rails.application.routes.draw do
  
  root to: 'home#index'
  namespace :api do
    resources :movies
    resources :people
    post   '/signup',   to: 'users#create'
    post 'user_token' => 'user_token#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
