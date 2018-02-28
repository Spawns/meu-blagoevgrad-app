class AddInstagramToAppConfigs < ActiveRecord::Migration
  def change
    add_column :app_configs, :in_url, :string
  end
end
