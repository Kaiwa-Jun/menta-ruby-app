class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notified_by, null: false, foreign_key: { to_table: :users }
      t.string :notification_type
      t.references :post, null: false, foreign_key: true
      t.boolean :read, default: false

      t.timestamps
    end
  end
end