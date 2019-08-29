class Ticket < ApplicationRecord
  belongs_to :user
  validates :ticket_type, :photo, :price, :ticket_number, presence: true
  validates :ticket_number, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
