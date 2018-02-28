class AddAttachmentAvatarToOrganizers < ActiveRecord::Migration
  def self.up
    change_table :organizers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :organizers, :avatar
  end
end
