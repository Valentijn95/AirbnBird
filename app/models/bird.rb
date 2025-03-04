class Bird < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :species, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
