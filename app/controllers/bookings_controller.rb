class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    if !current_user
      render :loginalert, status: :unprocessable_entity
    else
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.save
      if @booking.save
      redirect_to bird_path(@booking.bird_id), notice: "booking succesfull ✅"
      else
        redirect_to bird_path(@booking.bird_id), notice: "booking not succesfull"
      end
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
