Rails.application.routes.draw do
  root 'static#index'
  get '/login', to:'sessions#new'
  get '/auth/facebook/callback', to:'sessions#fbcreate'
  post 'sessions/new', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'
  resources :users, only: [:show, :new, :create]
  post 'users/new', to:"users#create"
  resources :leagues, only: [:show, :new, :create, :destroy, :index] do
    resources :fleets, only: [:show, :index, :new]
  end

  post 'leagues/new', to:"leagues#create"
  resources :fleets, only: [:show, :new, :create, :destroy, :index, :edit, :update]
  post 'fleets/new', to:"fleets#create"

end
