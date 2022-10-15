Rails.application.routes.draw do
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :entities, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :entities
  devise_for :users
  root to: 'groups#index'
  resources :users do
    collection do
      get 'after_sign_out_for'
    end
  end

  get '/users/sign_in' => 'groups#index'
  get '/users/sign_out' => 'groups#index'
end
