Rails.application.routes.draw do
  # delete experiences route later because it's unsafe
  # resources :experiences
  get 'experiences/get_recommendations'
  post 'experiences/get_recommendations'
  post 'user_token' => 'user_token#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Test routes, delete it later
  get 'application/test'
  post 'application/test'
  get 'secure/test'
  post 'secure/test'
end
