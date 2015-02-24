Rails.application.routes.draw do

  resources :profiles, only: [:show]
  root 'default#index'
  get "/search", to: "users#search", as: "search"
  resources :users, only: [:new, :show, :create] do
    resources :items, except: [:destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
