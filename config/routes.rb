Rails.application.routes.draw do

  mount Notifications::Engine => "/notifications"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # users controller
  resources :users

# session controller
  resource :session, :only => [:new, :create, :destroy, :show]

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

    # film submissions
    resources :submissions

    # donations
    resources :donations, :only => [:new, :create]




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
