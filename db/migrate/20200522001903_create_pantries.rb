class CreatePantries < ActiveRecord::Migration[6.0]
  def change
    create_table :pantries do |t|
      t.string :name, null: false
      t.string :description
      t.string :website
      t.string :street
      t.string :city
      t.string :county
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :email, null: false
      t.integer :status, null: false, index: true, default: 0
      t.integer :max_daily_bags, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
