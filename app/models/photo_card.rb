class PhotoCard < ApplicationRecord
  belongs_to :user
  validates :photo, :card_number, presence: true
  validates :card_number, uniqueness: true
end
