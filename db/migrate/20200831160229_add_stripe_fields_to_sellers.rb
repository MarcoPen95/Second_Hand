class AddStripeFieldsToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :uid, :string
    add_column :sellers, :provider, :string
    add_column :sellers, :access_code, :string
    add_column :sellers, :publishable_key, :string
  end
end
