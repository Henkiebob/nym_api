class RemoveFieldsFromHouse < ActiveRecord::Migration
  def change
    remove_column :houses, :password_salt, :string
    remove_column :houses, :password_hash, :string
    remove_column :houses, :password, :string
  end
end
