class CreatePassports < ActiveRecord::Migration
  def change
  
    create_table :passports do |t|
      t.string  :passport_issue 
      t.string   :passport_no 
      t.string   :birth_city 
      t.string   :country 
      t.string   :nationality 
      t.string   :province 

      t.belongs_to :application
      t.timestamps
    end
  end
end
