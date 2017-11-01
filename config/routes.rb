Rails.application.routes.draw do
  post 'checkin/checkin'
  post 'recommendations/recommend'
  post 'facebook_user_token' => 'facebook_user_token#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :user
  post 'secure/test'
end
