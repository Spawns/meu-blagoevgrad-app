class ApplicationStatus < ActiveRecord::Migration
  def change
    add_column :applications , :status , :boolean
  end
end
