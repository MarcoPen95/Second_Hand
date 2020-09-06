class ChangeCategoryToBeStringInSearches < ActiveRecord::Migration[5.2]
  def change
    change_column :searches, :category, :string
  end
end
