Rails.application.routes.draw do
  resources :tools
  resources :projects do
    resources :tools
  end
  
  resources :projects_tools

  resources :users

  resources :favorites, only: [:create, :destroy]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
