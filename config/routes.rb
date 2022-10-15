Rails.application.routes.draw do
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :entities, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :entities
  resources :transactions
  resources :categories
  devise_for :users
  resources :users
  
  root 'groups#index'

  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
