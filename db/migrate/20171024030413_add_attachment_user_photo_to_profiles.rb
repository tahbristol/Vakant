class AddAttachmentUserPhotoToProfiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :profiles do |t|
      t.attachment :user_photo
    end
  end

  def self.down
    remove_attachment :profiles, :user_photo
  end
end
