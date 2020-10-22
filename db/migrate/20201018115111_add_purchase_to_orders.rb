class AddPurchaseToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :purchase, foreign_key: true
  end
end
