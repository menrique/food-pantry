class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :street
      t.string :city
      t.string :county
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :email, null: false
      t.integer :size, null: false, default: 0
      t.decimal :income, null: false, precision: 8, scale: 2, default: 0
      t.boolean :accept_deliveries, null: false, default: true
      t.integer :status, null: false, index: true, default: 0
      t.references :user, null: false, foreign_key: true
      t.integer :pantry_id, index: true

      t.timestamps
    end
  end
end
