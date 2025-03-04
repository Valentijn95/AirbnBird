class Booking < ApplicationRecord
  belongs_to :bird
  belongs_to :user

  validates :user_id, :bird_id, :status, :start_date, presence: true
  validates :status, inclusion: { in: %w(pending accepted denied),
  message: "status can only be pending, accepted or denied" }
end
