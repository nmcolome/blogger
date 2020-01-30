Rails.application.routes.draw do
  root to: "articles#index"
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [:new, :create, :destroy]
  get "login", to: "author_sessions#new"
  get "logout", to: "author_sessions#destroy"
end
