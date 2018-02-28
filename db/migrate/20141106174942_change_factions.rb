class ChangeFactions < ActiveRecord::Migration
  def change
  
 
   add_column   :applications , :previous_experience , :text
   add_column   :applications , :student_organizations , :string
  end
end
