require 'spec_helper'

feature "Viewing dates" do
  scenario "Listing all dates" do
    daate = Factory.create(:daate, :event => "birthday")
    visit '/'
    click_link "birthday"
    page.current_url.should == daate_url(daate)
  end

  scenario "Listing future dates" do
    pastDaate = Factory.create(:daate, :event => "past",
      :day => 1, :month => 1, :year => 2005)
    futureDaate = Factory.create(:daate, :event => "future",
      :day => 1, :month => 1, :year => 2020)
    visit '/'
    page.should have_content("past")
    page.should have_content("future")
    click_link "Upcoming Dates"
    page.should have_content("future")
    page.should_not have_content("past")
  end
end