class AddRoleToPartners < ActiveRecord::Migration
  def change
     remove_column :partners, :type
     add_column :partners ,:role , :string
  end
end
