class AddFactionToSchema < ActiveRecord::Migration
  def change
    add_column :applications, :faction, :string
  end
end
