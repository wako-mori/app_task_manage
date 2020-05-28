Rails.application.routes.draw do
  devise_for :users

  root "tasks#index"
  resources :users, only: [:edit, :update]

end
