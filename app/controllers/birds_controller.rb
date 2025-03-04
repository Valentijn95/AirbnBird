class BirdsController < ApplicationController
  before_action :authenticate_user!

  def show
    # Find the bird by ID
    @bird = Bird.find(params[:id])
  end
end
