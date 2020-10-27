class AddCittaToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :città, :string

  end
end
