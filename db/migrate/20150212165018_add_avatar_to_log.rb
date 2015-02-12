class AddAvatarToLog < ActiveRecord::Migration
  def change
    add_column :logs, :avatar, :string
  end
end
