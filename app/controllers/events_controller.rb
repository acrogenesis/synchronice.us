# -*- encoding : utf-8 -*-
class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def addevents
    render :layout => false
    @hour = params[:hour] 
    @day = params[:day]

    @event = Event.where("weekday_id = ? AND day_hour = ?", @day, @hour)
    @user = current_user
    @user.events << @event
  end
  
  def rmevents

    @user = current_user
    @user.events.each do |d|
      d.destroy
    end
    respond_to do |format|
      format.html{ render :layout => false}
    end
  end
end
