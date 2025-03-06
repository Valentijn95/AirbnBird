class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    # Ensure the user is logged in first
    if !current_user
      redirect_to new_user_session_path, notice: "You need to be logged in to book a bird."
      return
    end

    @bird = Bird.find(booking_params[:bird_id])

    if @bird.user == current_user
      redirect_to bird_path(@bird), alert: "You cannot book your own bird!"
      return
    end

    # Handle the booking creation
    end_date = booking_params[:start_date].split(" to ").last
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.end_date = end_date

    if @booking.save
      redirect_to bird_path(@booking.bird_id), notice: "✅ Booking successful!"
    else
      redirect_to bird_path(@booking.bird_id), notice: "❌ Booking not successful: #{@booking.errors.full_messages.join(', ')}"
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
