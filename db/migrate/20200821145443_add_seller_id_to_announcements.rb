class AddSellerIdToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :seller_id, :integer
  end
end
