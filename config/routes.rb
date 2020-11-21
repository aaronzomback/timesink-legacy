Rails.application.routes.draw do

  mount Notifications::Engine => "/notifications"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

    namespace :intake do
    resources :user_names, only: %i[new create]
    resources :user_usernames, only: %i[new create]
    resources :user_locations, only: %i[new create]
    resources :user_email_passwords, only: %i[new create]
  end

  # users controller
  resources :users, :path => "join"

# session controller
  resource :session, :only => [:new, :create, :destroy, :show]

# user password resets
  resources :password_resets

  # multi-step form wizard
  resources :after_sign_ups, :path => "enter"

  # films controller
  resources :films, :path => "films" do
    resources :reviews, :path => "cafe"
    end

    resources :reviews do
      resources :comments, only: [:new, :create, :edit, :update, :destroy], module: :reviews
    end


      resources :films do
      member do
        put "like", to: "films#like"
      end
    end

    resources :comments do
    member do
      put "like", to: "comments#like"
    end
    end

    resources :reviews do
    member do
      put "like", to: "reviews#like"
    end
    end




   resources :comments, only: [] do
  resources :comments, only: [:new, :create, :edit, :update, :destroy], module: :comments
end

    # user account
    resource :account

    # blog
    # change path url to "blog" from "blog_post"
      resources :blog_posts, :path => "blog" do
          resources :comments, only: [:new, :create, :edit, :update, :destroy], module: :blog_posts
    end

    # forum
    # change path url to "forum" from "forum_post"
    resources :forum_posts, :path => "forum" do
      resources :comments
    end

    # stripe payments & processing
    resources :payment_intents
    resources :webhooks, only: [:create]
    resources :payment_intents_donations
    resources :webhooks_donations, only: [:create]


    # film submissions
    resources :submissions

    # donations
    resources :donations, :only => [:new, :create, :index]




  get "info", to: "pages#info"
  get "donate", to: "pages#donate"
  get "terms", to: "pages#terms"
  get "privacy_policy", to: "pages#privacy_policy"
  get "cookies_policy", to: "pages#cookies_policy"
  get "submit", to: "pages#submit"
  get "donation_success", to: "pages#donation_success"
  get "submission_success", to: "pages#submission_success"

  root "films#index"

end
