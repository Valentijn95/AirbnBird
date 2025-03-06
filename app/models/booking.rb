class Booking < ApplicationRecord
  belongs_to :bird
  belongs_to :user

  validates :status, :start_date, :end_date, presence: true
  validate :start_date_in_future?
  validate :end_date_after_start_date?
  validates :status, inclusion: { in: %w(pending accepted denied), message: "status can only be pending, accepted, or denied" }

  validate :cannot_book_own_bird

  private

  def start_date_in_future?
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "The start date you selected is in the past")
    end
  end

  def end_date_after_start_date?
    if start_date.present? && end_date < start_date
      errors.add(:start_date, "The end date you selected is before the start date")
    end
  end

  def cannot_book_own_bird
    if bird.user == user
      errors.add(:bird, "You cannot book your own bird")
    end
  end
end
