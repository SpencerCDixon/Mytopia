Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  resources :neighborhoods, only: [:index, :new, :show, :create] do
    resources :reviews do
      resources :comments
    end
  end
end
