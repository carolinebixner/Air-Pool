class AddFieldToPools < ActiveRecord::Migration[6.0]
  def change
    add_column :pools, :location, :string
  end
end
