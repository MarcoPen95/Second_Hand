class NotificationsController < ApplicationController

    before_action :authenticate_seller!

    def index
        @notifications = Notification.where(recipient: current_seller).unread
    end

    def mark_as_read 
        @notifications = Notification.where(recipient: current_seller).unread
        @notifications.update_all(read_at: Time.zone.now)
        
        render json: {success: true}
    end
    

end