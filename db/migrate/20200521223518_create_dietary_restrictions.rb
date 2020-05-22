class CreateDietaryRestrictions < ActiveRecord::Migration[6.0]
  def change
    create_table :dietary_restrictions do |t|
      t.string :allergen
      t.integer :restriction_type, null: false, index: true, default: 0
      t.integer :household_size, null: false, default: 0
      t.references :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end
