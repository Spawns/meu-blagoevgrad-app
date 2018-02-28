class CreateApplicat < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :dob
      t.string :email
      t.string :gender
      t.string :mobile_phone
      t.string :current_address
      t.string :university
      t.string :field_of_studies
      t.string :emergency_contact_person
      t.string :special_needs
      t.string :learned_from
      t.text :motivational_letter
      t.text :factions
      t.timestamps

    end
  end
end