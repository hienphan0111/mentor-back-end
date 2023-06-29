class Expertise < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 128 }
  validates :description, length: { maximum: 500 }

  has_and_belongs_to_many :mentors, null: true
end
