class AddAttachmentDocumentToConferenceDocuments < ActiveRecord::Migration
  def self.up
    change_table :conference_documents do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :conference_documents, :document
  end
end
