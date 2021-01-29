Rails.application.routes.draw do
  resources :tools
  resources :projects do
    resources :tools
  end

  resources :users

  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
