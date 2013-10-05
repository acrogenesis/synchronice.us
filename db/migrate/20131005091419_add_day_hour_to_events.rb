class AddDayHourToEvents < ActiveRecord::Migration
  def change
    add_column :events, :day_hour, :integer
  end
end
