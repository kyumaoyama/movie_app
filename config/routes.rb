Rails.application.routes.draw do
  get 'movies/search'
  get 'movies/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts do
  resources :comments, only: [:create]
  resource :favorites, only: [:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update,:create,:new]

  resources :users, only: [:show]

  resources :comments, only: [:destroy]
end
