class UsersEvents < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :event_id, :uid 
  belongs_to :user
  belongs_to :event

end
