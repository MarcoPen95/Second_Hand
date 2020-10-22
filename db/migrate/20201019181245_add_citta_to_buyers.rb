class AddCittaToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :citta, :string

  end
end
