class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :phone_number, :address, :postcode, :city, :country, :title, :sort_code, :account_number, presence: true
  validates :phone_number, uniqueness: true
  has_one :photo_card
  has_many :claims
  has_many :tickets
end
