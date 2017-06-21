class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :location, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
