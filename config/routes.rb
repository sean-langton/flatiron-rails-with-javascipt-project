Rails.application.routes.draw do
  root 'static#index'
  get '/login', to:'sessions#new'
  get '/auth/facebook/callback', to:'sessions#fbcreate'
  post 'sessions/new', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'
  resources :users, only: [:show, :new, :create]
  post 'users/new', to:"users#create"
  resources :leagues, only: [:show, :new, :create]
  post 'leagues/new', to:"leagues#create"
  get 'leagues', to:"leagues#index"
end
