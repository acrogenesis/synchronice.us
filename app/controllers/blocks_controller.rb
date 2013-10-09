# -*- encoding : utf-8 -*-
class BlocksController < ApplicationController
  def index
    @user = current_user
    @day_of_week = Time.now.wday 
    @hour = Time.now.hour
    if(@day_of_week ==0)
      @day_of_week = 7
    end
    @event_id = ((@day_of_week-1)*24)+@hour-5
    @events = UsersEvents.where("event_id = ?", @event_id)

  end
end
