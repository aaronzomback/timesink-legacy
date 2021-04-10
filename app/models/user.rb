class User < ApplicationRecord


  attr_writer :current_step
  attr_writer :avatar_cache

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :name, presence: true, :if => lambda { |u| u.current_step == "name" }
  validates :username, presence: true, uniqueness: true, :if => lambda { |u| u.current_step == "username" }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "is invalid. Check if it's in the correct format (i.e. timesink@gmail.com)", :on => :create }, :if => lambda { |u| u.current_step == "email_password" }
  validates :password, presence: true, :length => { :minimum => 8, :message => "Must be at least 8 characters"}, :on => :create, :if => lambda { |u| u.current_step == "email_password" }

  acts_as_voter

  mount_uploader :avatar, AvatarImageUploader

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :submissions, dependent: :destroy

  def review_likes
    @sum = 0

    reviews.all.each do |review|
      @sum = @sum + review.get_likes.size
    end

    @sum
  end

  def comment_likes
    @sum = 0

    comments.all.each do |comment|
      @sum = @sum + comment.get_likes.size
    end

    @sum
  end

  def sum(a, b)
    @count = a + b
    return @count
  end


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
