class AddEmergencyContactPersonPhoneToApplicationProcess < ActiveRecord::Migration
  def change
    add_column :applications, :emergency_contact_person_phone, :string
  end
end
