class RemoveInstitutionFromApplicatio < ActiveRecord::Migration
  def change
    remove_column :applications , :institution
  end
end
