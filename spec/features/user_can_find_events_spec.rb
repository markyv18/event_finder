require 'rails_helper'


describe "as a user" do
  it "i can enter a zipcode and find all events for that zip sorted by popularity " do
    visit '/'

    fill_in 'zip', with: 

  end
end
And I fill in the search box with 80202
And I click Find Events
The current path is `/search`
And I can see a list of 16 events for next month sorted by popularity
And I can see a header `196 events for July`.
For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
