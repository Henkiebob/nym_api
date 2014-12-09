class AddHashToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :password_hash, :string
  end
end
