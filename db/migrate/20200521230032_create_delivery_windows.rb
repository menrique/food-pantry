class CreateDeliveryWindows < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_windows do |t|
      t.time :from, null: false
      t.time :to, null: false
      t.integer :weekday, null: false, index: true, default: 0
      t.references :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end
