class AddStatusToPassport < ActiveRecord::Migration
  def change
    add_column :passports, :status, :string
  end
end
