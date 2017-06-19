class Venue < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.zip(zip)
    events = VenueService.zip_search(zip)
    events.map do |event|
      Venue.new(event)
    end
  end

end


attr_reader

def initialize(params)
  @event = params[:symbol]

    #event name
    #date and time
    #description (140 chars)
    #venue name (hyperlinked to venue page)
    #venue address

end
