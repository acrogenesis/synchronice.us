# -*- encoding : utf-8 -*-
class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def addevents
    @hour = params[:hour] 
    @day = params[:day]

    @event = Event.where("weekday_id = ? AND day_hour = ?", @day, @hour)
    @usuar = current_user
    @usuar.events << @event
  end

end
