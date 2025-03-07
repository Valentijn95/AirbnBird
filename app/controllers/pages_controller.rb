class PagesController < ApplicationController

  def home
  end

  def dashboard
    @user = current_user
    puts @user.id
    @birds = Bird.where(user_id: @user.id)
    @bookings = Booking.where(user_id: @user.id)
    @incoming_bookings = Booking.joins(:bird).where(birds: { user_id: @user.id })
    @bird_placeholder_img = "https://image.spreadshirtmedia.com/image-server/v1/compositions/T1412A1PA3703PT17X251Y10D1024934807W5655H8000/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/stupid-bird-mens-pique-polo-shirt.jpg"
  end

end
