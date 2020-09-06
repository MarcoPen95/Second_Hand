class AddTransactionFieldsToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :stripe_id, :string
    add_column :buyers, :stripe_transaction_id, :string
    add_column :buyers, :card_last4, :string
    add_column :buyers, :card_exp_month, :string
    add_column :buyers, :card_exp_year, :string
    add_column :buyers, :card_type, :string
  end
end
