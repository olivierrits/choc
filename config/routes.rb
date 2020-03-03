Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bars, only: [ :index, :show ]
  resources :shop, only: [ :index, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
