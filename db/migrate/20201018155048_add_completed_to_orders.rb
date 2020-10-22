class AddCompletedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :completed, :boolean, null: false, default: false

  end
end
