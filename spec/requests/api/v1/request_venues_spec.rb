require 'rails_helper'

describe "api end points for venues" do
  # Then I should receive a 200 JSON response containing all venues
  # And each venue has an id, name, address, url, latitude, and longitude
  # And the venue does not include the created_at or updated_at
  it "When I send a GET request to /api/v1/venues" do
    venue = Venue.create

    get '/api/v1/venues'
    expect(response).to be_success
    expect(response.status).to eq(200)

    response_items = JSON.parse(response.body)

    expect(response_items.count).to eq(1)
    expect(response_items.first["id"]).to eq(venue.id)
    expect(response_items.first["name"]).to eq(venue.name)
    expect(response_items.first["address"]).to eq(venue.address)
    expect(response_items.first["url"]).to eq(venue.url)
    expect(response_items.first["latitude"]).to eq(venue.latitude)
    expect(response_items.first["longitude"]).to eq(venue.longitude)

  end



  # Then I should receive a 200 JSON response containing the id, name, address, url, latitude, and longitude
  # And the venue does not include the created_at or updated_at
  it "When I send a GET request to /api/v1/venues/1" do
    venue = Venue.create(name: "Bob", address: "1331 17th street", url: "http:woo!", latitude: "40.0", longitude: "-105.0")

    get "/api/v1/venues/#{venue.id}"

    expect(response).to be_success
    expect(response.status).to eq(200)

    response_item1 = JSON.parse(response.body, symbolize_names: true)

    expect(response_item1[:id]).to eq(venue.id)
    expect(response_item1[:name]).to eq(venue.name)
    expect(response_item1[:address]).to eq(venue.address)
    expect(response_item1[:url]).to eq(venue.url)
    expect(response_item1[:latitude]).to eq(venue.latitude)
    expect(response_item1[:longitude]).to eq(venue.longitude)
  end

  # And it successfully deletes the venue from the database
  # Then I should receive a 204 JSON response
  xit "When I send a DELETE request to /api/v1/venues/1" do
    venue = Venue.create(id: 67842, name: "Bob", address: "1331 17th street", url: "http:woo!", latitude: "40.0", longitude: "-105.0")

    expect(Venue.count).to eq(1)

    delete "/api/v1/venues/67842"

    expect(response).to be_success
    expect(Venue.count).to eq(0)
    expect{Venue.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)

  end



  # And it successfully creates the record
  # Then I should receive a 201 JSON response
  # And I should receive a JSON response containing the id, name, url, latitude, and longitude
  # And the JSON response should not include the created_at or updated_at
  xit "When I send a POST request to /api/v1/venues with a name, address, url, latitude, and longitude" do
    post '/api/v1/venues'
  end

end
