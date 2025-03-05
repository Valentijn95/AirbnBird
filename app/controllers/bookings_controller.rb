class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      puts "booking saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
      params.require(:booking).permit(:start_date, :end_date, :bird_id)
  end

end
