Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :goals, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :comments, only:[:create]
end
