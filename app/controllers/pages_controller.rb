class PagesController < ApplicationController
  def home
    redirect_to birds_path
  end

  def dashboard
    @user = current_user
    @bird = Bird.where(user_id: @user.id)
  end
end
