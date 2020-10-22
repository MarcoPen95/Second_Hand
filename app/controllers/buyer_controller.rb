class BuyerController < ApplicationController
    before_action :authenticate_buyer!

    def home
    end

    def my_purchases
        #@transactions = Transaction.all

        #@transactions = Transaction.where(["buyer_id like ?", current_buyer.id])
        @purchases = current_buyer.purchases
        
        #@seller = Seller.find(@transactions.seller_id)
    end

    def my_favorites

        @favorites = current_buyer.favorites
    
    
    
    end







end