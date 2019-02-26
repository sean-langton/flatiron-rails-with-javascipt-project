Rails.application.routes.draw do
  root 'static#index'
  resources :users, only: [:show, :new, :create]
  post 'users/new', to:"users#create"
end
