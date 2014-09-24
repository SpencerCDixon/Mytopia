Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  resources :neighborhoods, only: [:index, :new, :show, :create] do
    resources :reviews, only: [:new, :create, :show] do
      resources :comments, only: [:new, :create]
    end
  end
end
