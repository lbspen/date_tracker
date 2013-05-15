require 'spec_helper'

feature "Deleting dates" do 
  scenario "Deleting a project" do
    Factory(:daate, :event => "birthday")
    visit "/"
    click_link "birthday"
    click_link "Delete Date"
    page.should have_content("Date has been deleted.")

    visit "/"
    page.should_not have_content("birthday")
  end
end