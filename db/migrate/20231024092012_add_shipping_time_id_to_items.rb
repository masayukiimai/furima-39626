class AddShippingTimeIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :shipping_time_id, :integer
  end
end
