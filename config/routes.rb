Rails.application.routes.draw do
  resources :entities
  resources :groups
  resources :transactions
  resources :categories
  devise_for :users
  resources :users
  root 'groups#index'

  
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

end
