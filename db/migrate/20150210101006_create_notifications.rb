class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.integer :house_id
      t.integer :status
      t.integer :user_id
      t.integer :priority

      t.timestamps
    end
  end
end
