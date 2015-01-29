class ChangeLogColumnName < ActiveRecord::Migration
  def change
    rename_column :logs, :taskname, :name
  end
end
