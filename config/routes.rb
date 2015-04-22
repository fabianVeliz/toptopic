Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace 'admin' do
    resources :users, only: :index
  end
end
