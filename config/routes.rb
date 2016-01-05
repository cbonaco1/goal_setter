Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :goals, only: [:index]
end
