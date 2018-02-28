class RenameEventDateToDayDate < ActiveRecord::Migration
  def change
     rename_column :days , :event_date , :day_date
  end
end
