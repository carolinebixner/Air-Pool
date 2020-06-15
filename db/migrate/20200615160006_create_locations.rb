class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.text :adress_line_1
      t.text :adress_line_2
      t.string :zipcode

      t.timestamps
    end
  end
end

# for geocoding use adress_line_1 instead of address
