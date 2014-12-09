class AddHouseToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :house_id, :integer
  end
end
