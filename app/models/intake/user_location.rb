module Intake
  class UserLocation
    include ActiveModel::Model
    attr_accessor :location
    validates :location, presence: true
  end
end
