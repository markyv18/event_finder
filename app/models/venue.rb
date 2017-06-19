class Venue < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.zip(zip)
    events = VenueService.zip_search(zip)
  end

end

#
#  attr_reader
#
#  def initialize(params)
#    @event =               params[:symbol]
#      event name           params[:title]
#      date and time        params[:start_time]
# description (140 chars)   params[:description]
# venue name                params[:venue_name]
# venue_url                 params[:venue_url]
# venue address             params[:venue_address]
