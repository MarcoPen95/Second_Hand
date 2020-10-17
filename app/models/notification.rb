class Notification < ApplicationRecord

    belongs_to :recipient, class_name: "Seller"
    belongs_to :actor, class_name: "Buyer"
    belongs_to :notifiable, polymorphic: true


    scope :unread, ->{ where(read_at: nil) }
end
