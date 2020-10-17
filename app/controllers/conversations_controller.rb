class ConversationsController < ApplicationController
    def create

        if current_buyer
            @conversation = Conversation.get(current_buyer.id, params[:user_id])
        elsif current_seller
            @conversation = Conversation.get(current_seller.id, params[:user_id])
        end

    add_to_conversations unless conversated?
  
      respond_to do |format|
        format.js
      end
    end


    def close
        @conversation = Conversation.find(params[:id])
    
        session[:conversations].delete(@conversation.id)
    
        respond_to do |format|
          format.js
        end
    end
  
    private
  
    def add_to_conversations
      session[:conversations] ||= []
      session[:conversations] << @conversation.id
    end
  
    def conversated?
      session[:conversations].include?(@conversation.id)
    end
  end