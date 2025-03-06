class PagesController < ApplicationController

  def home
  end

  def dashboard
    @user = current_user
    puts @user.id
    @birds = Bird.where(user_id: @user.id)
    @bookings = Booking.where(user_id: @user.id)
    @incoming_bookings = Booking.joins(:bird).where(birds: { user_id: @user.id })
  end

end
