class ChangeColumnsNameInBuyers < ActiveRecord::Migration[5.2]
  def change
    rename_column :buyers, :citta, :città
  end
end
