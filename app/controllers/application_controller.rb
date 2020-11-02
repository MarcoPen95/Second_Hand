class ApplicationController < ActionController::Base

    def favorite_text
        return @favorite_exists ? "Remove from Favorite" : "Add to Favorite"
        
    end

    helper_method :favorite_text
end
