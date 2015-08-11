require "spec_helper"

feature "User visits the home page" do
  scenario "they see the hero image" do
    visit root_path
    expect(page).to have_content("Hello world")
  end
end
