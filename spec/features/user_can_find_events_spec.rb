require 'rails_helper'


describe "as a user" do
  it "i can enter a zipcode and find all events for that zip sorted by popularity " do
    visit '/'

    fill_in 'q', with: "80202"

    click_on "Find Events"

    expect(current_path).to eq(search_path)
    expect(current_path).to eq('/search')

    # And I can see a list of 16 events for next month sorted by popularity
    expect(page).to have_content("Number of Events: 16")

    # And I can see a header `196 events for July`.
    within('h3') do
      expect(page).to have_content("195 events for July")
    end

    # For each event I can see...
    expect(page).to have_content("Denver Winery Tour")      #event name
    expect(page).to have_content("2017-07-02 11:00:00")      #date and time
    expect(page).to have_content("Mile High Wine Tours is the bes")      #description (140 chars)
    expect(page).to have_content(" Mile High Wine Tours")      #venue name (hyperlinked to venue page)
    expect(page).to have_content("817 17th St.")      #venue address
  end
end
