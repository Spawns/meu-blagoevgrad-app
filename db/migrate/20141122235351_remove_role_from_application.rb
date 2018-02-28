class RemoveRoleFromApplication < ActiveRecord::Migration
  def change
     remove_column :applications , :role
  end
end
