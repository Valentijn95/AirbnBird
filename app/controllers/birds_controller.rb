class BirdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @birds = Bird.all
  end

  def show
    # Find the bird by ID
    @bird = Bird.find(params[:id])
  end
  
end
