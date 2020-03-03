Rails.application.routes.draw do
  get 'bars/index'
  get 'bars/show'
  get 'shops/index'
  get 'shops/show'
  devise_for :users
  root to: 'pages#home'
  resources :bars, only: [ :index, :show ]
  resources :shops, only: [ :index, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
