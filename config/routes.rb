Rails.application.routes.draw do
  devise_for :users
  get 'tasks/index'

  root "tasks#index"
end
