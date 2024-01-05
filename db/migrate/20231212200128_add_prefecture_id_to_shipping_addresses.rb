class AddPrefectureIdToShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :prefecture_id, :integer, null: false
  end
end
