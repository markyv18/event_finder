class Venue < ActiveRecord::Base
  validates :name, uniqueness: true
  
  def self.zip(zip)
    events = VenueService.zip_search(zip)
    $event_number = events[:total_items]
    events = events[:events][:event]
  end

end
