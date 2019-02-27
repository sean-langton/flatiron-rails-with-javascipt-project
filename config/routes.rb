Rails.application.routes.draw do
  get 'leagues/index'
  get 'leagues/show'
  get 'leagues/new'
  get 'leagues/create'
  get 'leagues/destroy'
  get '/login', to:'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'
  root 'static#index'
  resources :users, only: [:show, :new, :create]
  post 'users/new', to:"users#create"
  get '/auth/facebook/callback', to:'sessions#fbcreate'
end
