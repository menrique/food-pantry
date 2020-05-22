class CreateDriverShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_shifts do |t|
      t.date :date, null: false
      t.time :from, null: false
      t.time :to, null: false
      t.integer :status, null: false, index: true, default: 0
      t.references :driver, null: false, foreign_key: true
      t.references :pantry_shift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
