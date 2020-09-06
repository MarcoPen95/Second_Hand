class SellerController < ApplicationController
    before_action :authenticate_seller!


    def home
    end


    def my_objects
        @announcements = current_seller.announcements


    end






end