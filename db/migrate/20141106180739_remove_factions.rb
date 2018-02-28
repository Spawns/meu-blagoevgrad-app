class RemoveFactions < ActiveRecord::Migration
  def change
   remove_column  :applications , :factions 
  end
end
