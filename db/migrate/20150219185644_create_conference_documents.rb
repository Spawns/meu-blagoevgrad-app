class CreateConferenceDocuments < ActiveRecord::Migration
  def change
    create_table :conference_documents do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
