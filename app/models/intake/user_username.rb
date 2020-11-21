module Intake
  class UserUsername
    include ActiveModel::Model
    attr_accessor :username
    validates :username, presence: true
  end
end
