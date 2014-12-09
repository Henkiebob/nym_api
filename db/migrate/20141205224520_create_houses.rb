class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :password
      t.string :password_salt

      t.timestamps
    end
  end
end
