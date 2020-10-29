class Order < ApplicationRecord
    belongs_to :seller
    belongs_to :announcement
    validates :announcement_id, presence: true
    validates :seller_id, presence: true
    validates :purchase_id, presence: true 
end