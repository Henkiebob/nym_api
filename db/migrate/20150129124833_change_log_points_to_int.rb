class ChangeLogPointsToInt < ActiveRecord::Migration
  def change
    change_column :logs, :points, :integer
  end
end
