Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "search", to: "pages#search"
  get "profile", to: "pages#profile"

  resources :claims, only: [:new, :create, :show, :index] do
    resources :tickets, only: [:new, :create]
  end
  resources :tickets, only: [:index]
  resources :photo_cards, only: [:new, :create]

end



