class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
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
      t.integer :status, index: true, null: false, default: 0
      t.boolean :current, null: false, default: true
      t.references :user, foreign_key: true
      t.references :pantry, foreign_key: true

      t.timestamps
    end
  end
end
