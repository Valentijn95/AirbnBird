class Bird < ApplicationRecord
  belongs_to :user

  validates :description, :title, presence: true
  validates :price, presence: true
end
