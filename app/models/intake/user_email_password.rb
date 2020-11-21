module Intake
  class UserEmailPassword
    include ActiveModel::Model
    attr_accessor :email
    attr_accessor :password
    attr_accessor :password_confirmation
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :on => :create }
    validates :password, presence: true, :length => { :minimum => 8, :message => "Must be at least 8 characters"}, :on => :create
  end
end
