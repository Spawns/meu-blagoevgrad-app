class RemoveOrg < ActiveRecord::Migration
  def change
     remove_column   :applications ,:student_organizations 
  end
end
