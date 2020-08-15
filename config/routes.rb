Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # users controller
  resources :users

# session controller
  resource :session

  # films controller
  resources :films do
    resources :reviews
  end

  get "info", to: "pages#info"
  get "donate", to: "pages#donate"
  get "terms", to: "pages#terms"
  get "privacy_policy", to: "pages#privacy_policy"
  get "cookies_policy", to: "pages#cookies_policy"

  root "films#index"

end
