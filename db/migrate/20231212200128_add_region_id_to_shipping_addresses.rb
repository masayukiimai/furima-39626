class AddRegionIdToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :region_id, :integer, null: false
  end
end
