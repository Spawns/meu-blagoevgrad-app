class ChangeConferenceDocumentsDescriptionFieldType < ActiveRecord::Migration
  def change
    change_column :conference_documents, :description , :text
  end
end
