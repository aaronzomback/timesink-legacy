Rails.application.routes.draw do

  mount Notifications::Engine => "/notifications"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # users controller
  resources :users, :only => [:new, :create, :show, :destroy], :path => "join"

# session controller
  resource :session, :only => [:new, :create, :destroy, :show]

  # session from reset_password
  resource :blob

# user password resets
  resources :password_resets

  resources :volumes, :path => "cinema"  do
    resources :films
  end


  resources :user_submissions, :only => [:index, :show], :path => "user-submissions"
  resources :user_reviews, :only => [:index], :path => "upvotes"


  # film submissions
  resources :submissions

  # donations
  resources :donations, :only => [:new, :create, :index]


  # films controller
  resources :films do
    resources :reviews, only: [:index, :create, :new, :show, :edit, :update, :destroy], :path => "cafe"
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

    # newsletters
    resources :newsletters


  get "info", to: "pages#info"
  get "donate", to: "pages#donate"
  get "newsletter", to: "newsletters#new"
  get "terms", to: "pages#terms"
  get "privacy_policy", to: "pages#privacy-policy"
  get "submit", to: "pages#submit"
  get "donation_success", to: "pages#donation_success"
  get "submission_success", to: "pages#submission_success"
  get "reset", to: "pages#reset"
  match "/404", to: "errors#not_found", via: :all
  match "/408", to: "errors#timeout", via: :all
  match "/422", to: "errors#unprocessable_entity", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  delete 'logout', to: 'sessions#destroy'

  root "films#index"

end
