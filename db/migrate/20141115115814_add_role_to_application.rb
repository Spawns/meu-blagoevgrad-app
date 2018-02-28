class AddRoleToApplication < ActiveRecord::Migration
  def change
     add_column   :applications , :role , :string
  end
end
