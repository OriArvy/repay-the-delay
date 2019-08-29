Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "search", to: "pages#search"
  get "profile", to: "pages#profile"

  resources :claims, only: [:new, :create, :show, :index]
  get "add_ticket/:id", to: "claims#add_ticket", as: :add_ticket
  post "attach_ticket/:id", to: "claims#attach_ticket", as: :attach_ticket
  resources :tickets, only: [:new, :create, :index]
  resources :photo_cards, only: [:new, :create]

end



