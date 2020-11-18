class User < ApplicationRecord


  attr_writer :current_step

  validates_presence_of :name, :if => lambda { |u| u.current_step == "name" }
  validates_presence_of :username, :if => lambda { |u| u.current_step == "username" }
  validates_presence_of :email, :if => lambda { |u| u.current_step == "email_password" }
  validates_presence_of :password, :if => lambda { |u| u.current_step == "email_password" }

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

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[name username location avatar email_password]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
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
