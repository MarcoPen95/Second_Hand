class Announcement < ApplicationRecord

    mount_uploader :image, ImageUploader
    serialize :image, JSON
    belongs_to :seller, optional: true
    has_many   :purchases
    validates :title, :category, :price, presence:true
    validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
    validates :title, length: {maximum: 140, too_long: "%{count} characters is the maximum allowed"}
    validates :price, length: {maximum: 7}

    CATEGORY = %w{Elettronics Car Telephony}
    CONDITION = %w{New Excellent Mint Used Poor }
end