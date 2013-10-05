class Weekday < ActiveRecord::Base
  attr_accessible :name
  has_many :events
  has_many :blocks
end
