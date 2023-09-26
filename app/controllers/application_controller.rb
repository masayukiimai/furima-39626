Rails.application.routes.draw do
  # デフォルトでdeviseが提供するルーティングを追加し、カスタムコントローラーも指定します
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  # 他のルーティング...
  resources :users, only: [:new, :create, :edit, :update, :show]
  # rootパスも設定してください。例えば、users#indexをrootとして設定する場合：
  root 'users#index'
end