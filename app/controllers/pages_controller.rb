class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @bird = Bird.where(user_id: @user.id)
  end
end
