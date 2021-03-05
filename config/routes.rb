Rails.application.routes.draw do

  get "/projects/digital", to: "projects#digital"
  get "/projects/traditional", to: "projects#traditional"

  resources :projects do
    resources :projects_tools
  end

  resources :tools

  resources :projects_tools

  resources :users do
    resources :projects 
  end

  resources :favorites, only: [:create, :destroy]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "sessions#create"
  get "/auth/failure", to: redirect('/')


  root 'welcome#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
