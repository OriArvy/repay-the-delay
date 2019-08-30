class Ticket < ApplicationRecord
  belongs_to :user
  validates :photo, :price, :ticket_number, presence: true
  validates :ticket_number, uniqueness: true, length: { is: 5 }
  mount_uploader :photo, PhotoUploader
end
