class CreateCreateUsersEventsJoinTables < ActiveRecord::Migration
  def change
    create_table :users_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :uid
    end


  end
end
