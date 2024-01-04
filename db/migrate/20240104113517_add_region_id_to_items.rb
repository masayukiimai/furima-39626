# db/migrate/xxxxxx_add_region_id_to_items.rb

class AddRegionIdToItems < ActiveRecord::Migration[7.0]
  def up
    add_column :items, :region_id, :integer
  end

  def down
    remove_column :items, :region_id
  end
end
