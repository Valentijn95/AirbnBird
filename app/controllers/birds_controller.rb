class BirdsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_bird, only: [:show, :edit, :update, :destroy]

  def index

  end
  def show
    # Find the bird by ID
    @bird = Bird.find(params[:id])
  end

  def new
    @bird = Bird.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def initialize_bird()
    @bird = Bird.find(params[:id])
  end



end
