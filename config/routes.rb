Rails.application.routes.draw do
  resources :projects do
    resources :projects_tools
  end

  resources :tools

  resources :projects_tools

  resources :users

  resources :favorites, only: [:create, :destroy]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
