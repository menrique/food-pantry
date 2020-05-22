class CreateBagTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :bag_types do |t|
      t.string :name, null: false
      t.string :description
      t.string :allergen
      t.integer :dietary_restriction, null: false, default: 0
      t.references :pantry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
