class AddCalendarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :calendar, :boolean, :default=> nil
  end
end
