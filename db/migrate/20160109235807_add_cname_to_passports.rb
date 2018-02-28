class AddCnameToPassports < ActiveRecord::Migration
  def change
    remove_column :applications, :country_name
    add_column :passports, :country_name, :string
  end
end
