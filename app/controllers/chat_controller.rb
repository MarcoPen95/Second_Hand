class ChatController < ApplicationController
    def index
      session[:conversations] ||= []

      if buyer_signed_in?
      @users = Seller.all

      elsif seller_signed_in?
      @users = Buyer.all
      end

      @conversations = Conversation.includes(:recipient, :messages)
                                   .find(session[:conversations])
    end
  end