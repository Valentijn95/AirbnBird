require "cloudinary"

class BirdsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :initialize_bird, only: [:show, :edit, :update, :destroy]

  def index
    @birds = Bird.all
  end

  def show
    # Find the bird by ID
    @bird = Bird.find(params[:id])
    @booking = Booking.new
    @accepted_bookings = @bird.bookings.where(status: "accepted")
    @booked_dates = @accepted_bookings.pluck(:start_date, :end_date) do |range|
      (range[0]..range[1]).to_a
    end
  end

  def new
    @bird = Bird.new
    @categories = ["Exotic birds", "Large birds", "Birds for Therapy", "Birds for Breeding", "Messenger Birds"]
  end

  def create

    @bird = Bird.new(bird_params)
    @bird.user = current_user
    if @bird.save
      redirect_to birds_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    if @bird.update(bird_params)
      redirect_to @bird, notice: "Bird updated successfully!"
    else
      render :edit, alert: "Couldn't update this bird."
    end
  end

def destroy
  @bird = Bird.find(params[:id])

  if @bird && @bird.destroy
    redirect_to dashboard_path, notice: 'Bird successfully deleted.'
  else
    redirect_to dashboard_path, alert: 'Failed to delete bird.'
  end
end


  private

  def initialize_bird
    @bird = Bird.find_by(id: params[:id])

    unless @bird
      redirect_to birds_path, alert: "Bird not found."
    end
  end


  def bird_params
    params.require(:bird).permit(:title, :description, :price, :categories, :photo)
  end


end
