class Bird < ApplicationRecord
  belongs_to :user

  validates :description, :user_id, :price, :title, presence: true
end
