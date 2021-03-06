Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace 'admin' do
    resources :users, only: :index
    resources :topics do
      get 'favorite_topics', on: :collection, param: :id
    end

    resources :comments, only: [:index, :show, :destroy]

    root 'topics#index'
  end

  resources :topics, only: [:index, :show], param: :slug do
    resources :comments,  only: :create
  end

  resources :favorites, only: [:create, :index, :destroy], param: :slug
  resources :reports, only: :create

  root 'topics#index'
end
