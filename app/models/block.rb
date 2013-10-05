class Block < ActiveRecord::Base
  self.table_name = "blocks"
  attr_accessible :weekday_id

  belongs_to :weekday

  has_many :users_blocks, :class_name=>"UsersBlocks" 
  has_many :users, :through=>:users_blocks
end
