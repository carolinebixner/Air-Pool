class AddCityToPools < ActiveRecord::Migration[6.0]
  def change
    add_column :pools, :city, :string
  end
end
