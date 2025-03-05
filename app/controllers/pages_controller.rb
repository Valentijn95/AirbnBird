class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    puts @user.id
    @birds = Bird.where(user_id: @user.id)
  end
end
