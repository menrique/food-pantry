class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :status, null: false, index: true, default: 0
      t.references :driver, foreign_key: true
      t.references :driver_shift, foreign_key: true
      t.references :household, foreign_key: true
      t.references :pantry, foreign_key: true

      t.timestamps
    end
  end
end
