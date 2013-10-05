class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date_time :start
      t.date_time :end

      t.timestamps
    end
  end
end
