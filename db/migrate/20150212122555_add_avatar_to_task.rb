class AddAvatarToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :avatar, :string
  end
end
