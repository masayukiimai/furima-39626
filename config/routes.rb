Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "items#index"
  resources :items, only: [:index] 
  resources :users, only: [:index,]
  # Defines the root path route ("/")
  # root "articles#index"
end

