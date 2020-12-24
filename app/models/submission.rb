class Submission < ApplicationRecord

    belongs_to :user

    extend FriendlyId
    friendly_id :title, use: :slugged

    validates :title, presence: true
    validates :year, presence: true
    validates :description, presence: true
    validates :film_link, presence: true


  end
