class SearchController < ApplicationController
  attr_reader :events

  def index
    @events = Venue.zip(params[:q])
    @event_number = $event_number
  end
end
