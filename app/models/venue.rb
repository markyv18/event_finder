class Venue < ActiveRecord::Base
  validates :name, uniqueness: true
  attr_reader :event_number
                # :event,
  #             :date_time,
  #             :description,
  #             :venue_name,
  #             :venue_url,
  #             :venue_address

  def self.zip(zip)
    events = VenueService.zip_search(zip)
    @event_number = events[:total_items]
    events = events[:events][:event]
    events.map do |event|
      require "pry"; binding.pry
      event =          event[:title]
      date_time =      event[:start_time]
      description =    event[:description]   #(limit to 140 chars)
      venue_name =     event[:venue_name]
      venue_url =      event[:venue_url]
      venue_address =  event[:venue_address]
    end
  end

end
