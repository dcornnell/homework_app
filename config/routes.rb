Rails.application.routes.draw do
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :locations
  resources :courses
  resources :cohorts
  resources :enrollments
end
