class ApplicationController < ActionController::Base

    def favorite_text
        return @favorite_exists ? "Rimuovi dai preferiti" : "Aggiungi ai preferiti"
        
    end

    helper_method :favorite_text
end
