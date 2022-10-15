Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :entities, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :entities
  devise_for :users
  resources :users do
    resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
