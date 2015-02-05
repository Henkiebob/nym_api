class AddHouseIdToLog < ActiveRecord::Migration
  def change
    add_column :logs, :house_id, :integer
  end
end
