Rails.application.routes.draw do
  resources :users
  resources :rooms
  resources :reservations
  root "top#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
