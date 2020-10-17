class AddOauthFieldsToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :uid, :string
    add_column :buyers, :providers, :string
  end
end
