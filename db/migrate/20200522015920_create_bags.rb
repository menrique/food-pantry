class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.string :description
      t.string :allergen
      t.integer :dietary_restriction, null: false, default: 0
      t.integer :status, index: true, null: false, default: 0
      t.references :bag_type, null: false, foreign_key: true
      t.references :pantry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
