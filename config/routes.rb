Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "search", to: "pages#search"
  get "profile", to: "pages#profile"

  get "review", to: "admin#review"
  get "admin", to: "admin#dashboard"

  resources :claims, only: [:new, :create, :show, :index, :update] do
    resources :tickets, only: [:new, :create]
    resources :photo_cards, only: [:new, :create]
  end
  resources :tickets, only: [:index]

end



