class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(announcement: Announcement.find(params[:announcement]), buyer: current_buyer)
    @announcement = Announcement.find(params[:announcement])
    if favorite == []
      #Create the favorite
    @favorite = Favorite.create(announcement: Announcement.find(params[:announcement]), buyer: current_buyer)
    @favorite_exists = true


    respond_to do |format|
      if @favorite.save
      #create the notifications
      @user = current_buyer
      # Sends email to user when user is created.
      ExampleMailer.sample_email(@user).deliver_now
      Notification.create(recipient: @announcement.seller, actor: current_buyer, action: "prefer" ,notifiable: @announcement)
      Order.create(description: "ciao",seller:@announcement.seller,announcement: @announcement)
      format.html { redirect_to buyer_my_favorites_path, notice: 'Annuncio aggiunto ai preferiti' }
      format.js {}
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end


    else
      #Delete favorites
    favorite.destroy_all
    @favorite_exists = false
    end
  end
end
