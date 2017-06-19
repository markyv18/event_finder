class VenueService

#{"API_Key"}
  def self.zip_search(zip)
    response = Faraday.get("http://api.eventful.com/json/events/search?app_key=2J7ttvFCd8S3W2vT&location=#{zip}&sort_order=popularity&date=july&page_size=16")
    JSON.parse(response.body, symbolize_names: true)
  end
end
