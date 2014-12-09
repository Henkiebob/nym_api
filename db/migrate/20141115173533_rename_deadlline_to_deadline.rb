class RenameDeadllineToDeadline < ActiveRecord::Migration
  def change
    rename_column :tasks, :deadlline, :deadline
  end
end
