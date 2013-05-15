require 'spec_helper'

feature 'Creating Dates' do
  scenario "Can create a date" do
    visit '/'
    click_link 'New Date'
    fill_in 'Month', :with => '5'
    fill_in 'Day', :with => '5'
    fill_in 'Year', :with => '2013'
    fill_in 'Event', :with => "Cinco de Mayo"
    click_button "Create Date"
    page.should have_content("Date has been created")
  end
end