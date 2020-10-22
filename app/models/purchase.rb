class Purchase < ApplicationRecord
    belongs_to :announcement
    belongs_to :buyer
    has_many :order

end
