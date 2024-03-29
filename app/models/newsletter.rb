class Newsletter < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "is invalid. Check if it's in the correct format including @ and no special characters)"}

end
