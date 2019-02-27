Rails.application.routes.draw do
  get 'login', to:'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  root 'static#index'
  resources :users, only: [:show, :new, :create]
  post 'users/new', to:"users#create"
end
