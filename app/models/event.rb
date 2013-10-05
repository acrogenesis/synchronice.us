class Event < ActiveRecord::Base
  attr_accessible :weekday_id, :day_hour

  belongs_to :weekday

  has_many :users_events, :class_name=>"UsersEvents"
  has_many :users, :through=>:users_events

  def simulated_date
    day_now = Time.now.wday
    if(day_now==0)
      day_now = 7
    end
    if(weekday_id<day_now)
      date = (day_now-weekday_id).day.ago
    end
    if(weekday_id>day_now)
      date = (weekday_id-day_now).day.from_now
    end
    if(weekday_id==day_now)
      date = Time.now
    end
    return DateTime.new(date.year, date.month, date.day, self.day_hour, 0, 0)
  end


end
