Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'
  root 'static#index'
  resources :users, only: [:show, :new, :create]
  post 'users/new', to:"users#create"
end
