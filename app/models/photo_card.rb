class PhotoCard < ApplicationRecord
  belongs_to :user
  validates :photo, :card_number, presence: true
  validates :card_number, uniqueness: true, length: { minimum: 5 }
  mount_uploader :photo, PhotoUploader
end
