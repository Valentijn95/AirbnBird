class Booking < ApplicationRecord
  belongs_to :bird
  belongs_to :user

  validates :status, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(pending accepted denied),
  message: "status can only be pending, accepted or denied" }
end
