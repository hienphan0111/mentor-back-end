class Expertise < ApplicationRecord
  validates :name, presence: true, length: { minimum: 20, maximum: 128 }
  validates :description, length: { maximum: 500 }

  belongs_to :mentor
end
