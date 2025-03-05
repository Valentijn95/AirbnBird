class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    end_date = booking_params[:start_date].split(" to ").last
    @booking = Booking.new(booking_params)
    @bird = Bird.find(booking_params[:bird_id])
    if !current_user
      redirect_to new_user_session_path, notice: "You need to be logged in to book a bird."
      return
    end

    @booking.user = current_user

    @booking.end_date = end_date

    # @booked_dates = @bird.bookings.pluck(:start_date, :end_date) do |range|
    #   (range[0]..range[1]).to_a
    # end.flatten

    if @booking.save
      redirect_to bird_path(@booking.bird_id), notice: "✅ Booking succesfull "
    else
      redirect_to bird_path(@booking.bird_id), notice: "❌ Booking not successfull: #{@booking.errors[:start_date][0]}"
    end
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
      params.require(:booking).permit(:start_date, :bird_id, :end_date)
  end

end
