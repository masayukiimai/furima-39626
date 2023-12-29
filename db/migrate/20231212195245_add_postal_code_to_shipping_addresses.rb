class AddPostalCodeToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :postal_code, :string, null: false, limit: 8
  end
end
