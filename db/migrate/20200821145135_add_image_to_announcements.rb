class AddImageToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :image, :string
  end
end
