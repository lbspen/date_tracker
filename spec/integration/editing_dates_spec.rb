require 'spec_helper'

feature "Editing Dates" do
  before do
    Factory(:daate, :event => "birthday")
    visit "/"
    click_link "birthday"
    click_link "Edit Date"
  end

  scenario "Updating a date" do
    fill_in "Event", :with => "birthday party"
    click_button "Update Daate"
    page.should have_content("Date has been updated.")
  end

  scenario "Updating a date with invalid attributes" do
    fill_in "Event", :with => ""
    click_button "Update Daate"
    page.should have_content("Date has not been updated.")
  end
end