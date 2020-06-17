class RemoveFieldFromPools < ActiveRecord::Migration[6.0]
  def change
    remove_column :pools, :location_id, :integer
  end
end
