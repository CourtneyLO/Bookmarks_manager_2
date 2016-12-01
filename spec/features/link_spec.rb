require 'spec_helper'

feature "Link", :type => :feature do
  scenario "See links on home page for sites frequently visited" do
    Link.create(url: "http://www.makersacademy.com/", title: "Makers Academy")

    visit "/links"

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content("Makers Academy")
    end
  end
end
