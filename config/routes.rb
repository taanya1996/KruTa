Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"

  resources :comments

  resources :users do
    resources :comments
  end

  resources :tweets do
    resources :comments
  end

  resources :users do
    resources :tweets
  end

end