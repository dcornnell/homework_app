Rails.application.routes.draw do
  
  root 'sessions#new'
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      patch :change_admin_status
    end
  end

  resources :locations
  resources :courses
  resources :cohorts
  resources :enrollments
  resources :assignments
  resources :homeworks
  resources :comments
end
