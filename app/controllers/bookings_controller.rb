class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @bird = Bird.find(booking_params[:bird_id])
    if @bird.user == current_user
      redirect_to bird_path(@bird), alert: "You cannot book your own bird!"
      return
    end
    end_date = booking_params[:start_date].split(" to ").last
    @booking = Booking.new(booking_params)
    if !current_user
      redirect_to new_user_session_path, notice: "You need to be logged in to book a bird."
      return
    end

    @booking.user = current_user

    @booking.end_date = end_date

    if @booking.save
      redirect_to dashboard_path(@booking.bird_id), notice: "✅ Booking succesfull "
    else
      redirect_to bird_path(@booking.bird_id), notice: "❌ Booking not successfull: #{@booking.errors[:start_date][0]}"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if params[:update_type] == "accept"
      @booking.update(status: "accepted")
      @booking.save
      redirect_to dashboard_path, notice: "You accepted this booking!"
    elsif params[:update_type] == "decline"
      @booking.update(status: "declined")
      @booking.save
      redirect_to dashboard_path, notice: "You declined this booking."
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @owner = @booking.bird.user
    if @owner == current_user
      @booking.update(status: "accepted")
      @booking.save
    else
      redirect_to dashboard_path, notice: "You can't accept this booking"
    end
  end

  private

  def booking_params
      params.require(:booking).permit(:start_date, :bird_id, :end_date)
  end

end
