module AnnouncementsHelper

    def announcement_author(announcement)
        seller_signed_in? && current_seller.id == announcement.seller.id
    end
end
