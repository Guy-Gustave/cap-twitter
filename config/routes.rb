Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  root to:"users#new"
  resources :carsnews
  resources :sessions, only: [:new, :create, :destroy]
end
