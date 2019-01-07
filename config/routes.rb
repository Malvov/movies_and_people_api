Rails.application.routes.draw do
  
  root to: 'home#index'

  concern :api_base do
    resources :movies
    resources :people
    post   '/signup',   to: 'users#create'
    post 'user_token' => 'user_token#create'
  end

  namespace :api do
    concerns :api_base
  end

  namespace :api do
    namespace :v2 do
      concerns :api_base
     end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
