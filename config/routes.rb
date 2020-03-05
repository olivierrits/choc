Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bars, only: [ :index, :show ] do
    resources :bar_reviews, only: [ :new, :create ]
  end
  resources :shops, only: [ :index, :show ] do
    resources :shop_reviews, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
