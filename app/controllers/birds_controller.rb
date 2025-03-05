class BirdsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_bird, only: [:show, :edit, :update, :destroy]

  def index
    @birds = Bird.all
  end

  def show
    # Find the bird by ID
    @bird = Bird.find(params[:id])
    @booking = Booking.new
  end

  def new
    @bird = Bird.new
    @categories = ["Exotic birds", "Large birds", "Birds for Therapy", "Birds for Breeding", "Messenger Birds"]
  end

  def create
    @bird = Bird.new(bird_params)
    @bird.user = current_user
    if @bird.save!
      redirect_to birds_path
    else
      render 'form', notice: t("couldn't create this bird")
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def initialize_bird
    @bird = Bird.find(params[:id])
  end

  def bird_params
    params.require(:bird).permit(:title, :description, :price, :categories)
  end


end
