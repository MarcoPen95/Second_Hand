class Transaction < ApplicationRecord
    belongs_to :announcement
    belongs_to :buyer
end
