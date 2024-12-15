Rails.application.routes.draw do

  ## need to expound on this ##
  root "main#index"
  get "main/index"
  ## need to expound on this ##
  
  ## need to expound on this ##
  resources :categories do
    member do
      # add the delete action
      # since it's not included
      # by default
      get :delete
    end
  end
  
  resources :tasks do
    member do
      get :delete
    end
  end

  resources :subtasks do
    member do
      get :delete
    end
  end
  ## need to expound on this ##

  # Authentication routes
  # Can I use resources here?
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  #


  # get "users/index"
  # get "users/show"
  # get "users/edit"
  # get "users/delete"

  # get "categories/index"
  # get "categories/show"
  # get "categories/new"
  # get "categories/edit"
  # get "categories/delete"
  
  # get "tasks/index"
  # get "tasks/new"
  # get "tasks/edit"
  # get "tasks/delete"
  # get "tasks/show"

  # get "subtasks/index"
  # get "subtasks/show"
  # get "subtasks/edit"
  # get "subtasks/delete"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
end
