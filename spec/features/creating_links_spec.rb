require 'spec_helper'

feature "Add link", :type => :feature do
  scenario "Allows user to add link" do
    visit '/links/new'
    fill_in('url', :with => "http://www.makersacademy.com/")
    fill_in('title', :with => "Makers Academy")
    click_button("Create Link")

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content("Makers Academy")
    end
  end
end
