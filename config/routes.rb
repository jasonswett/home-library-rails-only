Rails.application.routes.draw do
  resources :tags
  devise_for :users
  resources :authors
  resources :books
  root "books#index"
end
