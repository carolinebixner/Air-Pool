class CreateAvailableDates < ActiveRecord::Migration[6.0]
  def change
    create_table :available_dates do |t|
      t.references :pool, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
