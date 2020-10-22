class Order < ApplicationRecord
    belongs_to :seller
    belongs_to :announcement
    belongs_to :purchase

end