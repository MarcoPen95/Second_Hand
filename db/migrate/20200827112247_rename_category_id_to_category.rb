class RenameCategoryIdToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :searches, :category_id, :category
  end
end
