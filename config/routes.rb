Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :hotels, only: [:new, :create, :show, :index]
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
