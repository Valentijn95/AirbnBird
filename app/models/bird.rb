class Bird < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :description, :title, presence: true
  validates :price, presence: true
end
