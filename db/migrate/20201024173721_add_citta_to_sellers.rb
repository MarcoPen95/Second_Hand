class AddCittaToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :città, :string

  end
end
