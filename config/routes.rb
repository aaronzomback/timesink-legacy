Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # users controller
  resources :users

# session controller
  resource :session

  # films controller
  resources :films do
    resources :reviews do
      resources :comments
    end
  end

    resources :comments do
      resources :comments
    end

    # blog
    resources :blog_posts, :path => "blog"

    # forum
    resources :forum_posts, :path => "forum" do
      resources :comments
    end

    # film submissons
    resources :submissions


  get "info", to: "pages#info"
  get "donate", to: "pages#donate"
  get "terms", to: "pages#terms"
  get "privacy_policy", to: "pages#privacy_policy"
  get "cookies_policy", to: "pages#cookies_policy"
  get "submissions_info", to: "pages#submissions_info"

  root "films#index"

end
