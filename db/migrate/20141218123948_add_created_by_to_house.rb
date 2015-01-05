class AddCreatedByToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :created_by, :integer
  end
end
