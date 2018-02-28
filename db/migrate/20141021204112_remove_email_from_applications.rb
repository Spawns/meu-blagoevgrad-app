class RemoveEmailFromApplications < ActiveRecord::Migration
  def change
   remove_column :applications , :email
  end
end
