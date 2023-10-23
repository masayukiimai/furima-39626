Rails.application.routes.draw do
   #get 'items/index'
   #Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root to: "items#index"
   resources :items, only: [:index,  :new, :create] 
  devise_for :users


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
   end
 
  # resources :users, only: [:index,]
   #Defines the root path route ("/")
  # root "articles#index"

end
