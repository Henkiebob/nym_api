class AddAuthFieldToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :auth_token, :string
  end
end
