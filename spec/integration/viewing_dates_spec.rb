require 'spec_helper'

feature "Viewing dates" do
  scenario "Listing all dates" do
    daate = Factory.create(:daate, :event => "birthday")
    visit '/'
    click_link "birthday"
    page.current_url.should == daate_url(daate)
  end
end