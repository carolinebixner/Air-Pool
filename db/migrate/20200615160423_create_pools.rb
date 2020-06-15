class CreatePools < ActiveRecord::Migration[6.0]
  def change
    create_table :pools do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.integer :capacity
      t.integer :price
      t.boolean :has_lifeguard
      t.boolean :children_friendly
      t.boolean :jacuzzi_section
      t.boolean :climatization
      t.boolean :pool_side
      t.boolean :has_floats
      t.boolean :towels_include
      t.boolean :pet_friendly
      t.boolean :salted_water
      t.boolean :includes_bar


      t.timestamps
    end
  end
end
