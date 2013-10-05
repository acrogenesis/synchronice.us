class AddWeekdayIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :weekday_id, :int
  end
end
