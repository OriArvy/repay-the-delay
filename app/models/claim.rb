class Claim < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  validates :location_from, :location_to, :departure_time, presence: true
end
