class Bird < ApplicationRecord
  belongs_to :user

  validates :description, :price, :title, presence: true
end
