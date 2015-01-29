class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :taskname
      t.string :username
      t.string :points

      t.timestamps
    end
  end
end
