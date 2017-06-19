class Venue < ActiveRecord::Base
  validates :name, uniqueness: true
  attr_reader :event,
              :date_time,
              :description,
              :venue_name,
              :venue_url,
              :venue_address

  def initialize(params)
     params[:title]
     params[:start_time]
     params[:description]   #(limit to 140 chars)
     params[:venue_name]
     params[:venue_url]
     params[:venue_address]
  end

  def self.zip(zip)
    events = VenueService.zip_search(zip)
  end

end
