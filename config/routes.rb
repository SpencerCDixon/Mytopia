Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  resources :neighborhoods, except: [:destroy, :update] do
    resources :reviews, except: [:index] do
      resources :comments, except: [:index, :show]
    end
  end


  namespace :admin do
    resources :neighborhoods, only: [:index, :edit, :update, :destroy]
  end


  resources :users, only: [:show, :index]
end
