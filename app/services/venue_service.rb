class VenueService

  def self.zip_search(zip)
    response = Faraday.get("")
    events = JSON.parse(response.body, symbolize_names: true)
  end
end
