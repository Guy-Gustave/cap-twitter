Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  root to:"users#new"
  resources :sessions, only: [:new, :create, :destroy]
  resources :opinions
  get '/followto', to: 'followings#followto'
  get '/follow', to: 'followings#follow',as: "follow"
end
