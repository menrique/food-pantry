class CreateAvailableDriverShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :available_driver_shifts do |t|
      t.time :from, null: false
      t.time :to, null: false
      t.integer :weekday, null: false, index: true, default: 0
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end