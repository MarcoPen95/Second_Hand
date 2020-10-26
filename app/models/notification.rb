class Notification < ApplicationRecord

    belongs_to :recipient, class_name: "Seller"
    belongs_to :actor, class_name: "Buyer"
    belongs_to :notifiable, polymorphic: true
    validates :recipient_id, presence:true
    validates :actor_id, presence:true
    validates :notifiable_id, presence:true 


    scope :unread, ->{ where(read_at: nil) }
end
