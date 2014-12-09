class AddAttachmentAvatarToHouses < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :houses, :avatar
  end
end
