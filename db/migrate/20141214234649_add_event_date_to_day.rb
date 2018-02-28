class AddEventDateToDay < ActiveRecord::Migration
  def change
    add_column :days, :event_date, :date
  end
end
