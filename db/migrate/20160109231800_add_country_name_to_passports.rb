class AddCountryNameToPassports < ActiveRecord::Migration
  def change
    add_column :applications, :country_name, :string
  end
end
