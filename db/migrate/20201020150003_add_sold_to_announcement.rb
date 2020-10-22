class AddSoldToAnnouncement < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :sold, :boolean, null: false, default: false

  end
end
