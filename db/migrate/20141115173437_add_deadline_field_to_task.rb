class AddDeadlineFieldToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :deadlline, :datetime
  end
end
