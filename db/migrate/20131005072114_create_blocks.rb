class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :weekday_id

      t.timestamps
    end
  end
end
