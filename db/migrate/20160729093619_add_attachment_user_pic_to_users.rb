class AddAttachmentUserPicToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :user_pic
    end
  end

  def self.down
    remove_attachment :users, :user_pic
  end
end
