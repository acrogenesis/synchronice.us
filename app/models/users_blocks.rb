class UsersBlocks < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :block_id, :uid

  belongs_to :user
  belongs_to :block
end
