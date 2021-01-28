Rails.application.routes.draw do
  resources :project_tools
  resources :tools
  resources :projects
  resources :users

  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
