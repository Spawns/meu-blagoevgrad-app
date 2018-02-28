class RenameTypeToRole < ActiveRecord::Migration
  def change
    remove_column :organizers ,:type
    add_column :organizers ,:role , :string
  end
end
