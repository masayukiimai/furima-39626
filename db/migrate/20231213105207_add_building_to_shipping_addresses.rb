class AddBuildingToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :building, :string
  end
end
