Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  resources :neighborhoods, except: [:destroy] do
    resources :reviews, except: [:index] do
      resources :comments, except: [:index, :show]
      post 'upvote', to: "reviews#upvote"
      post 'downvote', to: "reviews#downvote"
    end
  end

  namespace :admin do
    resources :neighborhoods, only: [:index, :show, :edit, :update, :destroy] do
      resources :reviews, only: [:index, :show, :edit, :update, :destroy] do
        resources :comments, only: [:index, :show, :edit, :update, :destroy]
      end
    end
  end

  resources :users, only: [:show, :index, :edit, :update]
end
