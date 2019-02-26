Rails.application.routes.draw do
  root 'static#index'
  post 'users/new', to:"users#create"
end
