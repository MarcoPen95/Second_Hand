class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :category
      t.text :description
      t.string :condition
      t.decimal :price, precision: 5, scale: 2 , default: 0

      t.timestamps
    end
  end
end
