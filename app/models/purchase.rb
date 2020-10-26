class Purchase < ApplicationRecord
    belongs_to :announcement
    belongs_to :buyer
    has_many :order
    validates :announcement_id, presence:true
    validates :buyer_id, presence:true
end
