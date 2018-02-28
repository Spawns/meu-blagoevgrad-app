class AddAppId < ActiveRecord::Migration
  def change
    add_column   :applications , :institution , :string
  end
end
