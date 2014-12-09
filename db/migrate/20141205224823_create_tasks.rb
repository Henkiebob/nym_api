class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :deadline
      t.string :duration
      t.string :points
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
