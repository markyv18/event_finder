class SearchController < ApplicationController
  attr_reader :events
  
  def index
    @events = Venue.zip(params[:q])
  end
end
