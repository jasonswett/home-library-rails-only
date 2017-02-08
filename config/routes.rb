Rails.application.routes.draw do
  namespace :admin do
    resources :users
resources :authors
resources :authors_books
resources :books
resources :books_tags
resources :tags

    root to: "users#index"
  end

  resources :tags
  devise_for :users
  resources :authors
  resources :books
  root "books#index"
end
