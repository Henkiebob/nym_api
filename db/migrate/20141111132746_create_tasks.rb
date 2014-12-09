class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :duration
      t.string :iteration

      t.timestamps
    end
  end
end
