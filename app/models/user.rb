class User < ApplicationRecord


  acts_as_voter

  mount_uploader :avatar, AvatarImageUploader

  has_many :reviews
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :submissions

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, :length => { :minimum => 8, :message => "Must be at least 8 characters"}, :on => :create

  has_secure_password

  def to_param
    username
  end

  def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
end
# This generates a random password reset token for the user
def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

end
