Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'tasks#index'
  resources :tasks
  resources :users, only: [:new, :create, :show]
    namespace :admin do
      resources :users
    end
  resources :sessions
  resources :labels
  resources :labellings, only: [:create, :destroy]
end
