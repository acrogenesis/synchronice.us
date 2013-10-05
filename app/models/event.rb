class Event < ActiveRecord::Base
  attr_accessible :weekday_id

  belongs_to :weekday

  has_many :users_events, :class=>"UsersEvents"
  has_many :users, :through=>:users_events


end
