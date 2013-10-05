# -*- encoding : utf-8 -*-
class EventsController < ApplicationController

  def index
    @events = current_user.events
  end

  def addevents
    render :layout => false
    @hour = params[:hour] 
    @day = params[:day]

    @event = Event.where("weekday_id = ? AND day_hour = ?", @day, @hour)
    @user = current_user
    @u = UsersEvents.create!(:user_id => @user.id, :event_id => @event[0].id, :uid => @user.uid)
    @u.save
  end
  
  def rmevents

    @user = current_user
    @user.users_events.each do |d|
      d.destroy
    end
    respond_to do |format|
      format.html{ render :layout => false}
    end
  end
end
