class Message < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  belongs_to :conversation


  #after_create_commit { MessageBroadcastJob.perform_later(self) }
end
