Rails.application.routes.draw do
  devise_for :users
<<<<<<< Updated upstream
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
=======
  root to: "users#index"
  resources :users 
end
>>>>>>> Stashed changes
