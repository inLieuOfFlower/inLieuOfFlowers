class AddAttachmentAvatarToHonoreds < ActiveRecord::Migration
  def self.up
    change_table :honoreds do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :honoreds, :avatar
  end
end
