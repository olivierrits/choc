Rails.application.routes.draw do
  get 'choc_its/new', to: 'choc_its#new'
  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'about', to: 'pages#about', as: :about
  get 'blog', to: 'pages#blog', as: :blog
  get 'pages/chocit', to: 'choc_its#new', as: :chocit
  get 'dashboard', to: 'users#dashboard', as: 'user_dashboard'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
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



  # get "/404", :to => "errors#not_found"
  # get "/500", :to => "errors#internal_error"
