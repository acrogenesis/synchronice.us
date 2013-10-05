class RemoveStartAndEndFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :start
    remove_column :events, :end
  end

  def down
    add_column :events, :start, :datetime
    add_column :events, :start, :datetime
  end
end
