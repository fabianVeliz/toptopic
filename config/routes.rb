Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace 'admin' do
    resources :users, only: :index
    resources :topics
  end

  resources :topics, only: [:index, :show], param: :slug

  root 'topics#index'
end
