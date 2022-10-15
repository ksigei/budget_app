Rails.application.routes.draw do
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :entities, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :entities
  devise_for :users
  root to: 'groups#index'
  resources :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
