Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "search", to: "pages#search"

  resources :claims, only: [:new, :create, :show]
  resources :tickets, only: [:new, :create]

end



