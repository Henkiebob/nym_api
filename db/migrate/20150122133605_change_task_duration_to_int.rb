class ChangeTaskDurationToInt < ActiveRecord::Migration
  def change
    change_column :tasks, :duration, :integer
  end
end
