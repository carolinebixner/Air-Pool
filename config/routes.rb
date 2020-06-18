Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pools do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit]
  resources :reviews, except: [:new, :create]
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  patch '/bookings/:id', to: 'bookings#change_status', as: :booking_status_change
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
