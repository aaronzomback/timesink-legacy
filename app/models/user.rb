class User < ApplicationRecord


  mount_uploader :avatar, AvatarImageUploader

  has_many :reviews
  has_many :comments
  has_many :submissions

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, :length => { :minimum => 8, :message => "Must be at least 8 characters"}, :on => :create


  has_secure_password

  def to_param
    username
  end

end
