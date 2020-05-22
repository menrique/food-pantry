class CreatePantryShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :pantry_shifts do |t|
      t.time :date, null: false
      t.date :from, null: false
      t.date :to, null: false
      t.integer :status, null: false, index: true, default: 0
      t.references :pantry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
