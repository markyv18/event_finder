class SearchController < ApplicationController
  def index
    @events = Venue.zip(params[:q])
  end
end
