class Ticket < ApplicationRecord
  belongs_to :user
  validates :ticket_type, :ticket_photo, :price, :ticket_number, presence: true
  validates :ticket_number, uniqueness: true
  mount_uploader :ticket_photo, PhotoUploader
end
