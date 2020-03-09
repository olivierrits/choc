Rails.application.routes.draw do
  get 'dashboard', to: 'users#dashboard', as: 'user_dashboard'
  devise_for :users
  root to: 'pages#home'
  resources :bars, only: [ :index, :show ] do

    collection do
      get 'search'
    end
    resources :bar_reviews, only: [ :new, :create ]
  end
  resources :shops, only: [ :index, :show ] do
    resources :shop_reviews, only: [ :new, :create ]
    collection do
      get 'search'
    end
  end

  get '/bars/:bar_id/favourite', to: 'bars#favourite', as: 'bar_favourite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
