class VenueService

#{"API_Key"}
  def self.zip_search(zip)
    response = Faraday.get("http://api.eventful.com/json/events/search?app_key=2J7ttvFCd8S3W2vT&location=#{zip}&sort_order=popularity&page_size=16")
    JSON.parse(response.body, symbolize_names: true)[:events][:event]
    require "pry"; binding.pry
  end
end
