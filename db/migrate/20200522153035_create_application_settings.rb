class CreateApplicationSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :application_settings do |t|
      t.timestamps
    end
  end
end
