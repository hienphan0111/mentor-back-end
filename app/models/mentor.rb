class Mentor < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 128 }
  validates :bio, length: { maximum: 500 }

  has_many :expertises
  has_many :reservations, dependent: :destroy
end
