class Reservation < ApplicationRecord
  validates :time, presence: true

  belongs_to :user
  belongs_to :mentor
end
