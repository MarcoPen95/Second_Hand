class Favorite < ApplicationRecord
  belongs_to :announcement
  belongs_to :buyer
  validates :announcement_id, presence:true
  validates :buyer_id, presence:true
end
