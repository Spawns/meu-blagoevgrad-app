class AddTypeAndTitleToOrganizers < ActiveRecord::Migration
  def change
     add_column :organizers, :type  , :string
     add_column :organizers , :title , :string
  end
end
