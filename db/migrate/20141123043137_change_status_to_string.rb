class ChangeStatusToString < ActiveRecord::Migration
  def change
    change_column :applications , :status , :string
  end
end
