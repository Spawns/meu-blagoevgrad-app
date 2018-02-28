class RemoveBioFromOrganizers < ActiveRecord::Migration
  def change
   remove_column  :organizers, :bio
   add_column :organizers, :bio , :text
  end
end
