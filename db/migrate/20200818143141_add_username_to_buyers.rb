class AddUsernameToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :username, :string
  end
end
