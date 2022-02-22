Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get :account
      get :profile
    end
  end
  resources :rooms do
    collection do
      get :my_rooms
    end
  end
  resources :reservations
  get 'search' => 'rooms#search'

  root "top#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
