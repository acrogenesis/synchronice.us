class Block < ActiveRecord::Base
  self.table_name = "blocks"
  attr_accessible :weekday_id

  has_many :users_blocks, :class=>"UsersBlocks" 
  has_many :users, :through=>:users_blocks
end
