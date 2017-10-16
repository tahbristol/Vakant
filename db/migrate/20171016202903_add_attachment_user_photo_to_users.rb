class AddAttachmentUserPhotoToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :user_photo
    end
  end

  def self.down
    remove_attachment :users, :user_photo
  end
end
