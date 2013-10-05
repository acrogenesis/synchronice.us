class AddDayHourToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :day_hour, :integer
  end
end
