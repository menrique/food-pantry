class CreateAdminProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_profiles do |t|
      t.integer :status, null: false, index: true, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
