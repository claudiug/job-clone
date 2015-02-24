Rails.application.routes.draw do
  #TODO ADD root with a different controller

  resources :users
  resources :sessions
  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
