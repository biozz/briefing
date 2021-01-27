require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'briefings#index'
  resources :briefings
  resources :bots
  resources :feeds
  devise_for :users
  devise_scope :user do
    authenticated :user do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
end
