class CreateAuthBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :auth_blacklists do |t|
      t.string :jti, null: false, index: true

      t.timestamps
    end
  end
end
