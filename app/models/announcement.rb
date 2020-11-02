class Announcement < ApplicationRecord

    mount_uploader :image, ImageUploader
    serialize :image, JSON
    belongs_to :seller, optional: true
    has_one  :purchase
    has_one  :order
    validates :title, :category, :price, presence:true
    validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}, presence:true
    validates :title, length: {maximum: 140, too_long: "%{count} characters is the maximum allowed"}
    validates :price, length: {maximum: 10}
    validates :seller_id, presence:true

    CATEGORY = %w{Eletronics Car Telephony Tools VideoGames Books HomeAndKitchen Computer Clothing}
    CONDITION = %w{New Excellent Mint Used Poor }
end