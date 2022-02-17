Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :rooms
  resources :reservations
  get 'users/account'
  get 'users/profile'
  root "top#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
