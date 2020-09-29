class User < ApplicationRecord

  has_many :reviews
  has_many :comments
  has_many :submissions

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def to_param
    username
  end

end
