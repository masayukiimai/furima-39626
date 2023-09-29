Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end

  
