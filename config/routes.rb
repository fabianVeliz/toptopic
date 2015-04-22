Rails.application.routes.draw do
  resources :topics

  devise_for :users
  devise_for :admins

  namespace 'admin' do
    resources :users, only: :index
    resources :topics
  end
end
