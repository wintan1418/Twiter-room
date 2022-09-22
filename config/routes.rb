require 'sidekiq/web'

Rails.application.routes.draw do
  # get 'tweets/index'
  # get 'tweets/create'
  # get 'tweets/destroy'
  # get 'tweet/index'
  # get 'tweet/create'
  # get 'tweet/destroy'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
    resources :tweets, except: [:edit, :update]


    resources :profiles

  devise_for :users
  root to: 'tweets#index'
 
end
