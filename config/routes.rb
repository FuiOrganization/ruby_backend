Rails.application.routes.draw do
  get 'recommendations/recommend'
  post 'recommendations/recommend'
  post 'facebook_user_token' => 'facebook_user_token#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :user
  # Test routes, delete it later
  get 'secure/test'
  post 'secure/test'
end
