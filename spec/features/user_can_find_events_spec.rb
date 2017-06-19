require 'rails_helper'


describe "as a user" do
  it "i can enter a zipcode and find all events for that zip sorted by popularity " do
    visit '/'

    fill_in 'zip', with: "80202"

    click_on "Find Events"

    expect(current_path).to eq(search_path)
    expect(current_path).to eq('/search')

    # And I can see a list of 16 events for next month sorted by popularity
    expect(page).to have_content("Number of Events: 16")

    # And I can see a header `196 events for July`.
    within('h3') do
      expect(page).to have_content("196 events for July")
    end

    # For each event I can see...
    expect(page).to have_content      #event name
    expect(page).to have_content      #date and time
    expect(page).to have_content      #description (140 chars)
    expect(page).to have_content      #venue name (hyperlinked to venue page)
    expect(page).to have_content      #venue address

  end
end
