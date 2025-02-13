Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    member do
      get :my_posts
    end
  end

  resources :posts

  namespace :admin do
    resources :posts, only: [:index, :edit, :update]
    get "dashboard", to: "dashboard#index"
  end

  root "posts#index"
end
