require 'spec_helper'

feature 'Creating Dates' do
  scenario "Can create a date" do
    visit '/'
    click_link 'New Date'
    fill_in 'Month', :with => '5'
    fill_in 'Day', :with => '5'
    fill_in 'Year', :with => '2013'
    fill_in 'Event', :with => "Cinco de Mayo"
    click_button "Create Daate"
    page.should have_content("Date has been created")
  end

  scenario "Can not create a date with blank fields" do
    visit '/'
    click_link "New Date"
    click_button "Create Daate"
    page.should have_content("Date has not been created.")
    page.should have_content("Month can't be blank")
    page.should have_content("Day can't be blank")
    page.should have_content("Year can't be blank")
    page.should have_content("Event can't be blank")
  end

  scenario "Can not create with invalid dates" do
    visit '/'
    click_link "New Date"
    fill_in 'Day', :with => '50'
    fill_in 'Month', :with => '15'
    fill_in 'Year', :with => '3'
    click_button "Create Daate"
    page.should have_content("Date has not been created.")
    page.should have_content("Day must be less than or equal to 31")
    page.should have_content("Month must be less than or equal to 12")
    page.should have_content("Year must be greater than or equal to 2000")
  end
end