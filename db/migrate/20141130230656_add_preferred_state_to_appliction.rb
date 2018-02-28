class AddPreferredStateToAppliction < ActiveRecord::Migration
  def change
    add_column :applications, :preferred_state, :string
  end
end
