Rails.application.routes.draw do
  root 'static#index'
  resources :users
  post 'users/new', to:"users#create"
end
