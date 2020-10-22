class SellerController < ApplicationController
    before_action :authenticate_seller!


    def home
    end

    def profile
        
    end


    def my_objects
        @announcements = current_seller.announcements


    end

    def my_orders
        @orders = Order.where(seller: current_seller,completed: false)
        @completed = Order.where(seller: current_seller,completed: true)



    end
    





end