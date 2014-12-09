class AddPasswordDigestToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :password_digest, :string
  end
end
