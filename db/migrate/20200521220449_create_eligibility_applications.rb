class CreateEligibilityApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :eligibility_applications do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :street
      t.string :city
      t.string :county
      t.string :state
      t.string :zip_code
      t.string :phone
      t.integer :household_size, null: false, default: 0
      t.decimal :income, precision: 8, scale: 2
      t.date :expire_on
      t.integer :status, null: false, index: true, default: 0
      t.references :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end
