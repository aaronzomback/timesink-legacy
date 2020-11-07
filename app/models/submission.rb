class Submission < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :film_link, presence: true


  end
