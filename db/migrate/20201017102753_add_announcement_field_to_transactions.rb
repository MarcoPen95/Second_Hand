class AddAnnouncementFieldToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :announcement_id, :integer
  end
end
